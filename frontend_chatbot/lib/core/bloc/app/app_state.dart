part of 'app_bloc.dart';

class AppState extends Equatable {
  final bool isInitialized;
  final User? user;
  final bool isAuthenticated;

  const AppState({
    this.isInitialized = false,
    this.user,
    this.isAuthenticated = false,
  });

  AppState copyWith({bool? isInitialized, User? user, bool? isAuthenticated}) {
    return AppState(
      isInitialized: isInitialized ?? this.isInitialized,
      user: user ?? this.user,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  List<Object?> get props => [isInitialized, user, isAuthenticated];
}
