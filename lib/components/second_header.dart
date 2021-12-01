import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/providers/initial.dart';
import 'package:todo_app_flutter/utility/shared_preference.dart';

class SecondHeader extends StatefulWidget {
  const SecondHeader({Key? key, required this.backFunction}) : super(key: key);

  final Function backFunction;

  @override
  createState() => _SecondHeaderState();
}

class _SecondHeaderState extends State<SecondHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => widget.backFunction(context),
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 40,
              )),
          IconButton(
              onPressed: () {
                UserPreferences().removeUser();
                Initial.removeData(context);
                Navigator.pushReplacementNamed(context, '/Login');
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 32,
              ))
        ],
      ),
    );
  }
}
