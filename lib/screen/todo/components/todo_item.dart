import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/todo.dart';
import 'package:todo_app_flutter/providers/todo_make_provider.dart';
import 'package:todo_app_flutter/providers/todo_provider.dart';
import 'package:todo_app_flutter/services/base_service.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    void delete() async {
      var response = await BaseService.deleteE("TodoTasks/${todo.id}");
      if (response.ok) {
        Provider.of<TodoProvider>(context, listen: false).removeTodo(todo.id);
      } else {
        print("error!!!");
      }
    }

    void updateComplite() async {
      Provider.of<TodoProvider>(context, listen: false)
          .updateCompliteTodo(todo);

      var response = await BaseService.updateE(("TodoTasks/${todo.id}"), todo);
      if (!response.ok) {
        print("error!!!");
      }
    }

    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 3),
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
      decoration: BoxDecoration(
        color: (todo.isCompleted) ? kPrimaryColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.0, color: Colors.black),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 3)),
        ],
      ),
      child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) =>
                    Provider.of<TodoMakeProvider>(context, listen: false)
                        .updateTodo(todo),
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                icon: Icons.edit,
              ),
              SlidableAction(
                onPressed: (context) => delete(),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () async => updateComplite(),
            child: Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.only(
                  left: kDefaultPadding / 2, top: kDefaultPadding / 3),
              child: Text(
                '${todo.taskName}',
                style: (todo.isCompleted)
                    ? CustomTextStyle.title2withLineThrough(context)
                    : CustomTextStyle.title2(context),
              ),
            ),
          )),
    );
  }
}
