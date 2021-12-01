import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/domain/todo.dart';
import 'package:todo_app_flutter/providers/todo_provider.dart';
import 'package:todo_app_flutter/screen/todo/components/todo_item.dart';

class TodosDisplay extends StatefulWidget {
  const TodosDisplay({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  _TodosDisplayState createState() => _TodosDisplayState();
}

class _TodosDisplayState extends State<TodosDisplay> {
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProv = Provider.of<TodoProvider>(context);
    List<Todo> todos = todoProv.getTodosByCategory(widget.category);

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(todo: todos[index]);
        });
  }
}
