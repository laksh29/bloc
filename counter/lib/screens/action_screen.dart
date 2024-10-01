import 'package:counter/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Actions"),
      ),
      body: BlocBuilder<CounterCubit, int>(
          bloc: counterCubit,
          builder: (context, counter) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => counterCubit.increment(),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 10.0),
                  FloatingActionButton(
                    backgroundColor: counter == 0 ? Colors.grey[300] : null,
                    onPressed: counter == 0
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Cannot display negative integers.")));
                          }
                        : () => counterCubit.decrement(),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.minimize),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
