import 'package:counter/cubits/counter_cubit.dart';
import 'package:counter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "Counter Example";
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: false,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
