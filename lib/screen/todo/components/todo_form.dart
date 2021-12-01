import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/domain/priority.dart';
import 'package:todo_app_flutter/domain/todo.dart';
import 'package:todo_app_flutter/providers/priority_provider.dart';
import 'package:todo_app_flutter/providers/todo_make_provider.dart';
import 'package:todo_app_flutter/providers/todo_provider.dart';
import 'package:todo_app_flutter/services/base_service.dart';
import 'package:todo_app_flutter/utility/widgets.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Todo todo;
  late List<Priority> priorities;
  late TodoMakeProvider todoMakeProv;
  late PriorityProvider priorityProv;

  @override
  Widget build(BuildContext context) {
    todoMakeProv = Provider.of<TodoMakeProvider>(context);
    todo = todoMakeProv.todo;
    if (!todo.haveId()) {
      todo.todoCategoryId = widget.category.id;
    }

    priorityProv = Provider.of<PriorityProvider>(context);
    priorities = priorityProv.priorities;

    Future<void> update() async {

      var response = await BaseService.updateE("TodoTasks/${todo.id}", todo);
      if (response.ok) {
        Provider.of<TodoProvider>(context, listen: false).updateTodo(todo);

        todoMakeProv.iniTodoWithCategoryId(widget.category.id);
      } else {
        print("error!!!");
      }
    }

    Future<void> post() async {
      var response = await BaseService.postE("TodoTasks", todo);
      if (response.ok) {
        todo.fromJson(response.data!);

        Provider.of<TodoProvider>(context, listen: false).addTodo(todo);

        todoMakeProv.iniTodoWithCategoryId(widget.category.id);
      } else {
        print("error!!!");
      }
    }

    Future<void> submit() async {
      final form = _formKey.currentState!;

      if (!form.validate()) {
        return;
      }
      form.save();

      if (todo.haveId()) {
        await update();
      } else {
        await post();
      }
      form.reset();
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 230,
                    child: TextFormField(
                        style: CustomTextStyle.formFieldDark(context),
                        onSaved: (value) => todo.taskName = value!,
                        validator: (value) {
                          return (value!.isEmpty)
                              ? "Description is required!"
                              : null;
                        },
                        decoration: buildInputDecorationDark(
                            context,
                            (todo.taskName == "")
                                ? "Description"
                                : todo.taskName,
                            Icons.task)),
                  ),
                  Container(
                    width: 230,
                    child: DropdownButtonFormField<String>(
                      value: todo.todoPriorityId,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? "Priority is required!"
                            : null;
                      },
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: CustomTextStyle.formFieldDark(context),
                      decoration: buildInputDecorationDark(
                          context, "Priority", Icons.signal_cellular_alt),
                      onChanged: (priorityId) =>
                          todo.todoPriorityId = priorityId,
                      items: priorities
                          .map<DropdownMenuItem<String>>((Priority priority) {
                        return DropdownMenuItem<String>(
                          value: priority.id,
                          child: Text(priority.priorityName),
                        );
                      }).toList(),
                    ),
                  )
                ],
              )),
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await submit();
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.add_task)),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/Priority"),
                child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.signal_cellular_alt)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
