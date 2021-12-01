import 'package:flutter/material.dart';
import 'package:todo_app_flutter/domain/priority.dart';

class PriorityProvider with ChangeNotifier {
  List<Priority> priorities = [];

  void addPriority(Priority priority) {
    priorities.insert(0, priority);
    notifyListeners();
  }

  void iniPriorities(List<Priority> priorities) {
    this.priorities = priorities;
    notifyListeners();
  }
}
