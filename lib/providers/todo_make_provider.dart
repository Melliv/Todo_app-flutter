import 'package:flutter/material.dart';
import 'package:todo_app_flutter/domain/todo.dart';

class TodoMakeProvider with ChangeNotifier {
  Todo todo = Todo();

  void updateTodo(Todo _todo) {
    todo = _todo;
    notifyListeners();
  }

  void iniTodo(Todo _todo) {
    todo = _todo;
    notifyListeners();
  }

  void iniTodoWithCategoryId(String categoryId) {
    todo = Todo();
    todo.todoCategoryId = categoryId;
    notifyListeners();
  }
}
