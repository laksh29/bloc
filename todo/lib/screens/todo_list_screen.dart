import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/models/todo_model.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.separated(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              Todo todo = todos.elementAt(index);
              return ListTile(
                title: Text(todo.name),
              );
            },
            separatorBuilder: (conotextx, index) {
              return const Divider();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-todo'),
        tooltip: "Add Todo Item",
        child: const Icon(Icons.add),
      ),
    );
  }
}
