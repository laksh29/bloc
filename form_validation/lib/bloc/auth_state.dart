part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  //? this uid in large applications will be user data model
  final String uid;

  AuthSuccess({required this.uid});
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}

final class AuthLoading extends AuthState {}
