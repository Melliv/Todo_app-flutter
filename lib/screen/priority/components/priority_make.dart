import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/screen/priority/components/Priority_form.dart';

class PriorityMake extends StatelessWidget {
  const PriorityMake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.0, color: Colors.black),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Create Priority",
            style: CustomTextStyle.title2(context),
          ),
          PriorityForm()
        ],
      ),
    );
  }
}
