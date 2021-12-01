import 'package:flutter/material.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/domain/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> todos = [];
  TodoSort todoSort = TodoSort.None;

  void addTodo(Todo todo) {
    todos.insert(0, todo);
    notifyListeners();
  }

  void removeTodo(String todoId) {
    this.todos = todos.where((todo) => todo.id != todoId).toList();
    notifyListeners();
  }

  void updateTodo(Todo _todo) {
    todos.forEach((todo) {
      if (todo.id == _todo.id) {
        todo = _todo;
      }
    });
    notifyListeners();
  }

  void updateCompliteTodo(Todo _todo) {
    todos.forEach((todo) {
      if (todo.id == _todo.id) {
        todo.isCompleted = !todo.isCompleted;
      }
    });
    notifyListeners();
  }

  void iniTodos(List<Todo> todos) {
    this.todos = todos;
    notifyListeners();
  }

  void sortByComplided() {
    todoSort = (todoSort == TodoSort.Complited)
        ? TodoSort.NotComplited
        : TodoSort.Complited;

    int sortNumber = (todoSort == TodoSort.Complited) ? 1 : -1;

    todos.sort((todo, _) => todo.isCompleted ? sortNumber : -sortNumber);

    notifyListeners();
  }

  void sortByPriority() {
    todoSort = (todoSort == TodoSort.PriorityUp)
        ? TodoSort.PriorityDown
        : TodoSort.PriorityUp;

    int sortNumber = (todoSort == TodoSort.PriorityUp) ? 1 : -1;

    //todos.sort((todo1, todo2) => todo1.priority.prioritySort > todo2.priority.prioritySort);

    notifyListeners();
  }

  List<Todo> getTodosByCategory(Category category) {
    return todos.where((todo) => todo.todoCategoryId == category.id).toList();
  }

  int getTodosCountByCategory(Category category) {
    return todos.where((todo) => todo.todoCategoryId == category.id).length;
  }

  int getCompletedTodosCountByCategory(Category category) {
    return todos
        .where((todo) =>
            todo.todoCategoryId == category.id && todo.isCompleted == true)
        .length;
  }
}

enum TodoSort { None, Complited, NotComplited, PriorityDown, PriorityUp }
