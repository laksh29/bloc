import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/bloc/auth_bloc.dart';
import 'package:form_validation/common/extensions.dart';
import 'package:form_validation/common/widgets/gradient_button.dart';
import 'package:form_validation/screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //? watch continously watches the Bloc for changes and keeps updating
    // we can consider using BLoC BlocBuilder, for a better option, or else use BlocConsumer if we need to handle varius states based on user
    // final data = context.watch<AuthBloc>().state as AuthSuccess;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (_) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading || state is AuthInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final data = state as AuthSuccess;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.uid),
                  10.whitespaceHeight,
                  GradientButton(
                    ctaText: "Logout",
                    onTap: () {
                      //? read only watches the bloc ones and updates it ones when called
                      context.read<AuthBloc>().add(LogOutRequested());
                    },
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
