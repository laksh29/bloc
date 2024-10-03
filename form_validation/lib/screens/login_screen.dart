import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/bloc/auth_bloc.dart';
import 'package:form_validation/common/extensions.dart';
import 'package:form_validation/common/widgets/gradient_button.dart';
import 'package:form_validation/common/widgets/login_field.dart';
import 'package:form_validation/common/widgets/social_button.dart';
import 'package:form_validation/screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (_) => false,
            );
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/signin_balls.png'),
                  const Text(
                    'Sign in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  50.whitespaceHeight,
                  const SocialButton(
                      iconPath: 'assets/logos/g_logo.svg',
                      label: 'Continue with Google'),
                  20.whitespaceHeight,
                  const SocialButton(
                    iconPath: 'assets/logos/f_logo.svg',
                    label: 'Continue with Facebook',
                    horizontalPadding: 90,
                  ),
                  15.whitespaceHeight,
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  15.whitespaceHeight,
                  LoginField(
                    hintText: 'Email',
                    controller: emailCont,
                  ),
                  15.whitespaceHeight,
                  LoginField(
                    hintText: 'Password',
                    controller: passwordCont,
                  ),
                  20.whitespaceHeight,
                  GradientButton(
                    ctaText: "Sign Up",
                    onTap: () {
                      context.read<AuthBloc>().add(
                            SignInRequested(
                              email: emailCont.text,
                              password: passwordCont.text,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


/*
Bloc Builder: rebuilds the part of the ui that is being returned by the builder. updated it based on the state that is emited by the bloc on calling the events.

BlocListener: used for functionality that needs to occur once per state change such as navigation, showing a snackbar, showing a dialog, etc...

BlocConsumer = BlocListener + BlocBuilder
 */