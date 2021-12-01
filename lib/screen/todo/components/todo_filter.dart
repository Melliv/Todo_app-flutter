import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/providers/todo_provider.dart';

class TodoFilter extends StatefulWidget {
  const TodoFilter({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  _TodoFilterState createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding / 2),
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
      child: Row(
        children: [
          Text("Complited:", style: CustomTextStyle.formFieldDark(context)),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => Provider.of<TodoProvider>(context, listen: false)
                .sortByComplided(),
            child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(Icons.check))
          ),
          SizedBox(width: 10),
          Text("Priority:", style: CustomTextStyle.formFieldDark(context)),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => print("This feature is not ready!"),
            child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(Icons.exposure_zero)),
          ),
        ],
      ),
    );
  }
}
