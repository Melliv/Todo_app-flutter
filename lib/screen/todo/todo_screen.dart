import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/components/second_header.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/providers/todo_make_provider.dart';
import 'package:todo_app_flutter/screen/todo/components/todo_description.dart';
import 'package:todo_app_flutter/screen/todo/components/todo_filter.dart';
import 'package:todo_app_flutter/screen/todo/components/todo_make.dart';
import 'package:todo_app_flutter/screen/todo/components/todos_display.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
        body: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(color: kBackgroundColor),
        alignment: Alignment.center,
        child: Column(
          children: [
            SecondHeader(backFunction: (BuildContext _context) {
              Navigator.pop(_context);
              Provider.of<TodoMakeProvider>(context, listen: false)
                  .iniTodoWithCategoryId(category.id);
            }),
            TodoDescription(category: category),
            SizedBox(height: 10),
            TodoMake(category: category),
            TodoFilter(category: category),
            TodosDisplay(category: category)
          ],
        ),
      ),
    ));
  }
}
