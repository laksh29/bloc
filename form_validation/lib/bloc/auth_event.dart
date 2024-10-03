part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested({
    required this.email,
    required this.password,
  });
}

final class LogOutRequested extends AuthEvent {}
