import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/utils/extensions.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late TextEditingController todoNameCont;

  @override
  void initState() {
    super.initState();
    todoNameCont = TextEditingController();
  }

  @override
  void dispose() {
    todoNameCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoNameCont,
              decoration: const InputDecoration(
                hintText: "Todo Item",
              ),
            ),
            10.whitespaceHeight,
            ElevatedButton(
              onPressed: () {
                context.read<TodoCubit>().addTodo(todoNameCont.text);
                Navigator.of(context).pop();
              },
              child: const Text("Add Item"),
            )
          ],
        ),
      ),
    );
  }
}

/*
!BlocProvider.of<TodoCubit>(context).addTodo(todoNameCont.text)
can also be wriitten as:
?context.read<TodoCubit>().addTodo(todoNameCont.text),
 */
