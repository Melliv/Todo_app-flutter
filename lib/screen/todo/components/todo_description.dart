import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/providers/todo_provider.dart';

class TodoDescription extends StatefulWidget {
  const TodoDescription({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  _TodoDescriptionState createState() => _TodoDescriptionState();
}

class _TodoDescriptionState extends State<TodoDescription> {
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProv = Provider.of<TodoProvider>(context);
    int todosCount = todoProv.getTodosCountByCategory(widget.category);
    int complitedTodosCount =
        todoProv.getCompletedTodosCountByCategory(widget.category);

    return Container(
      child: Column(
        children: [
          Text(
            widget.category.categoryName,
            style: CustomTextStyle.title2(context),
          ),
          Text(
            "All Tasks: $todosCount",
            style: CustomTextStyle.formFieldDark(context),
          ),
          Text(
            "Completed tasks: $complitedTodosCount",
            style: CustomTextStyle.formFieldDark(context),
          ),
        ],
      ),
    );
  }
}
