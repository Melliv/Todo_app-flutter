import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/providers/todo_make_provider.dart';
import 'package:todo_app_flutter/screen/todo/components/todo_form.dart';

class TodoMake extends StatefulWidget {
  const TodoMake({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  _TodoMakeState createState() => _TodoMakeState();
}

class _TodoMakeState extends State<TodoMake> {
  late TodoMakeProvider todoMakeProv;

  @override
  Widget build(BuildContext context) {
    todoMakeProv = Provider.of<TodoMakeProvider>(context);

    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.5, color: Colors.black),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Text(
            ((todoMakeProv.todo.haveId()) ? "Edit" : "Create") + " task",
            style: CustomTextStyle.title2(context),
          ),
          TodoForm(category: widget.category)
        ],
      ),
    );
  }
}
