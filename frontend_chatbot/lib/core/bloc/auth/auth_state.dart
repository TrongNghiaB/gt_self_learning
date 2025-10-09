part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? error;
  final User? user;

  const AuthState({this.status = AuthStatus.initial, this.error, this.user});

  AuthState copyWith({AuthStatus? status, String? error, User? user}) {
    return AuthState(
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  bool get isAuthenticated => user != null && status == AuthStatus.success;

  @override
  List<Object?> get props => [status, error, user];
}
