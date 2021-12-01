import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/providers/initial.dart';
import 'package:todo_app_flutter/utility/shared_preference.dart';

class DefaultHeader extends StatefulWidget {
  @override
  createState() => _DefaultHeaderState();
}

class _DefaultHeaderState extends State<DefaultHeader> {
  String name = "";

  @override
  void initState() {
    super.initState();
    UserPreferences().getFirstName().then((String result) => setState(() {
          name = result;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "What's up, $name!",
            style: CustomTextStyle.button(context),
          ),
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
