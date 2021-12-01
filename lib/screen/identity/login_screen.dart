import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/screen/identity/components/header.dart';
import 'package:todo_app_flutter/screen/identity/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            decoration: BoxDecoration(color: Color(0xFF195860)),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Column(
                children: [
                  Header(
                    login: false,
                    text: 'Log in to Account',
                  ),
                  SizedBox(height: 20),
                  LoginForm(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/Register');
                      },
                      child: Text("Sign up"))
                ],
              ),
            )),
      ),
    );
  }
}
