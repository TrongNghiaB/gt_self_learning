import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInitialized>(_onAppInitialized);
    on<AuthStateChanged>(_onAuthStateChanged);
  }

  void _onAppInitialized(AppInitialized event, Emitter<AppState> emit) {
    emit(state.copyWith(isInitialized: true));
  }

  void _onAuthStateChanged(AuthStateChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(user: event.user, isAuthenticated: event.user != null));
  }
}
