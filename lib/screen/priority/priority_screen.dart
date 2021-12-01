import 'package:flutter/material.dart';
import 'package:todo_app_flutter/components/second_header.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/screen/priority/components/priorities_display.dart';
import 'package:todo_app_flutter/screen/priority/components/priority_make.dart';

class PriorityScreen extends StatelessWidget {
  const PriorityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(_context).popUntil(ModalRoute.withName('/Category'));
            }),
            PriorityMake(),
            PrioritiesDisplay(),
          ],
        ),
      ),
    ));
  }
}
