import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/domain/fetch_response_multible.dart';
import 'package:todo_app_flutter/domain/priority.dart';
import 'package:todo_app_flutter/domain/todo.dart';
import 'package:todo_app_flutter/domain/user.dart';
import 'package:todo_app_flutter/providers/category_provider.dart';
import 'package:todo_app_flutter/providers/priority_provider.dart';
import 'package:todo_app_flutter/providers/todo_make_provider.dart';
import 'package:todo_app_flutter/providers/todo_provider.dart';
import 'package:todo_app_flutter/providers/user_provider.dart';
import 'package:todo_app_flutter/services/base_service.dart';
import 'package:todo_app_flutter/utility/shared_preference.dart';

class Initial {
  static removeData(BuildContext context) {
    Provider.of<CategoryProvider>(context, listen: false).iniCategories([]);
    Provider.of<PriorityProvider>(context, listen: false).iniPriorities([]);
    Provider.of<TodoProvider>(context, listen: false).iniTodos([]);
    Provider.of<TodoMakeProvider>(context, listen: false).iniTodo(Todo());
    Provider.of<UserProvider>(context, listen: false).setUser(User());
    UserPreferences().removeUser();
  }

  static loadInitialData(BuildContext context) async {
    await Future.wait([
      BaseService.getAllE("TodoCategories")
          .then((value) => _loadCategories(value, context)),
      BaseService.getAllE("TodoTasks")
          .then((value) => _loadTodos(value, context)),
      BaseService.getAllE("TodoPriorities")
          .then((value) => _loadPriorities(value, context)),
    ]);
  }

  static void _loadCategories(
      FetchResponseMultible response, BuildContext context) async {
    if (response.ok) {
      CategoryProvider categoryPro =
          Provider.of<CategoryProvider>(context, listen: false);

      List<Category> categories =
          List<Category>.from(response.data!.map((category) {
        Category cat = Category();
        cat.fromJson(category);
        return cat;
      }));

      categoryPro.iniCategories(categories);
    } else {
      print("categories error!");
    }
  }

  static void _loadTodos(
      FetchResponseMultible response, BuildContext context) async {
    if (response.ok) {
      TodoProvider todoPro = Provider.of<TodoProvider>(context, listen: false);

      List<Todo> todos = List<Todo>.from(response.data!.map((todo) {
        Todo _todo = Todo();
        _todo.fromJson(todo);
        return _todo;
      }));

      todoPro.iniTodos(todos);
    } else {
      print("Todos error!");
    }
  }

  static void _loadPriorities(
      FetchResponseMultible response, BuildContext context) async {
    if (response.ok) {
      PriorityProvider priorityPro =
          Provider.of<PriorityProvider>(context, listen: false);

      List<Priority> priorities =
          List<Priority>.from(response.data!.map((priority) {
        Priority _priority = Priority();
        _priority.fromJson(priority);
        return _priority;
      }));

      priorityPro.iniPriorities(priorities);
    } else {
      print("priorities error!");
    }
  }
}
