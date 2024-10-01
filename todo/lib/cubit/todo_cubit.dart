import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError("Title cannot be empty");
      return;
    }
    Todo todo = Todo(name: title, createdAt: DateTime.now());

/*
    state.add(todo);
    print(state);
    emit(state);

    !not a good practice
    state.add() modifies the state which should not be done because state should only be modifiable through the 'emit' function.

    !why was the new todo not showing up in the list whereas the state was being updated ?
    thats right! this was the ssue because when we were trying to update the state of the app outside of emit. (hover the emit keyword and read about it) emit does nothing if the current state == state being emitted! In the above code we are updating the state outside of the emit, hence emit gets the updated state as the current state and is emitig the current state. Hence it emits nothing!! (refer the cubit part in notes for diagram)
 */
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print("TODO Cubit: $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("TODO Cubit: $error");
  }
}
