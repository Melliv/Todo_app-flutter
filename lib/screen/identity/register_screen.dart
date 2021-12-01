import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/screen/identity/components/header.dart';
import 'package:todo_app_flutter/screen/identity/components/regiter_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            decoration: BoxDecoration(color: Color(0xFF134147)),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: ListView(
                children: [
                  Header(
                    login: true,
                    text: 'Create an Account',
                  ),
                  SizedBox(height: 20),
                  RegisterForm(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/Login');
                      },
                      child: Text("Log in"))
                ],
              ),
            )),
      ),
    );
  }
}
