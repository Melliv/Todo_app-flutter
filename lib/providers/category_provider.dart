import 'package:flutter/material.dart';
import 'package:todo_app_flutter/domain/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categories = [];

  void addCategory(Category category) {
    categories.insert(0, category);
    notifyListeners();
  }

  void iniCategories(List<Category> categories) {
    this.categories = categories;
    notifyListeners();
  }
}
