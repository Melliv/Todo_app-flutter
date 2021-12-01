import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.press}) : super(key: key);

  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await press();
      },
      child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
          child: Text(
            "+",
            style: TextStyle(fontSize: 32, color: Colors.black),
          )),
    );
  }
}
