part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class GoogleSignInRequested extends AuthEvent {
  const GoogleSignInRequested();
}

class AnonymousSignInRequested extends AuthEvent {
  const AnonymousSignInRequested();
}

class SignOutRequested extends AuthEvent {
  const SignOutRequested();
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

class CreateUserInFirestore extends AuthEvent {
  final User user;

  const CreateUserInFirestore(this.user);

  @override
  List<Object?> get props => [user];
}
