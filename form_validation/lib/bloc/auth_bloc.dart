import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<LogOutRequested>(_onLogoutRequested);
  }

  // can implement onChange, onError and onTransition
  // onTransition is a method that is present only in Bloc and not in cubit. The response of onTransition is the same as onChange but it also provides the event due to which the change occured. [Reason: Since cubits do not have events, it makes no sense having onTransition for cubits]

  // bloc is useful than cubits when we want to take use of reactive operators like buffered, debounce time, throttle, etc.
  /* 
  !what is debounce ?
  ? DEbounce is a way to deal with the execution of a fucntion until a certain amount of time has passed. 
refer: bloc_concurrency -> a package on pub.dev which talks and eals with reactive operators using bloc  
 */

  void _onSignInRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      final String email = event.email;
      final String password = event.password;

      if (password.length < 6) {
        return (emit(AuthFailure(
            errorMessage: "Password cannot be less than 6 characters.")));
      }
      // use regex for email validation
      if (!email.contains('@')) {
        return (emit(AuthFailure(errorMessage: "Enter a correct email.")));
      }

      //? we are using Future.delayed to mock an API request which would validated the auth credentials
      await Future.delayed(const Duration(seconds: 2)).then((_) {
        return (emit(AuthSuccess(uid: "$email:$password")));
      });
    } catch (e) {
      emit(AuthFailure(errorMessage: "Auth Bloc error: $e"));
      log("auth bloc error: $e");
    }
  }

  void _onLogoutRequested(
      LogOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      return (emit(AuthInitial()));
    });
  }
}
