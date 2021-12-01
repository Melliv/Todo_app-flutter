import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.text,
    required this.login,
  }) : super(key: key);

  final String text;
  final bool login;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Image.asset((login)
                    ? "assets/images/user_add.png"
                    : "assets/images/user.png"),
              ],
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
