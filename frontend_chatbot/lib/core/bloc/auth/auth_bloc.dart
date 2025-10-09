import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import '../../services/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthBloc({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignIn ?? GoogleSignIn(),
      super(const AuthState()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<AnonymousSignInRequested>(_onAnonymousSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<CreateUserInFirestore>(_onCreateUserInFirestore);
  }

  Future<void> _onGoogleSignInRequested(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: 'Sign in cancelled',
          ),
        );
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      if (userCredential.user != null) {
        // Check if this is a new user
        final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

        if (isNewUser) {
          // Create user in Firestore for new users
          add(CreateUserInFirestore(userCredential.user!));
        } else {
          // Update last login for existing users
          await UserService.updateLastLogin(userCredential.user!.uid);
        }

        emit(
          state.copyWith(status: AuthStatus.success, user: userCredential.user),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onAnonymousSignInRequested(
    AnonymousSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await _firebaseAuth.signInAnonymously();
      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      emit(state.copyWith(status: AuthStatus.success, user: null));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        // Only update last login if user is actually authenticated
        // and not in the process of signing out
        try {
          await UserService.updateLastLogin(user.uid);
        } catch (e) {
          // If update fails (e.g., permission denied), continue without error
          // This can happen during sign out process
          debugPrint('Warning: Failed to update last login: $e');
        }
        emit(state.copyWith(status: AuthStatus.success, user: user));
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: 'No authenticated user',
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onCreateUserInFirestore(
    CreateUserInFirestore event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await UserService.createOrUpdateUser(event.user);
      emit(state.copyWith(status: AuthStatus.success, user: event.user));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          error: 'Failed to create user profile: $e',
        ),
      );
    }
  }
}
