import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/components/submit_button.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/login.dart';
import 'package:todo_app_flutter/domain/user.dart';
import 'package:todo_app_flutter/providers/auth_provider.dart';
import 'package:todo_app_flutter/providers/initial.dart';
import 'package:todo_app_flutter/providers/user_provider.dart';
import 'package:todo_app_flutter/utility/validator.dart';
import 'package:todo_app_flutter/utility/widgets.dart';

class LoginForm extends StatefulWidget {
  @override
  createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    Login login = Login();

    Future<void> submit() async {
      final form = _formKey.currentState!;

      if (!form.validate()) {
        return;
      }
      form.save();

      Map<String, dynamic> response = await auth.login(login);

      if (response["status"]) {
        User user = User.fromJson(response);

        Provider.of<UserProvider>(context, listen: false).setUser(user);
        await Initial.loadInitialData(context);

        Navigator.pushReplacementNamed(context, '/Category');
      }
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: "jaana@poder.ee",
                  style: CustomTextStyle.formField(context),
                  onSaved: (value) => login.email = value!,
                  validator: (value) => validateEmail(value!),
                  decoration:
                      buildInputDecoration(context, "Email", Icons.email)),
              TextFormField(
                initialValue: "Foo.bar1",
                style: CustomTextStyle.formField(context),
                onSaved: (value) => login.password = value!,
                validator: (value) {
                  return (value!.isEmpty) ? "Your password is required" : null;
                },
                decoration:
                    buildInputDecoration(context, "Password", Icons.lock),
                obscureText: true,
              ),
              SizedBox(height: 20),
              SubmitButton(
                press: submit,
                submitText: 'Log In',
              ),
            ],
          ),
        ));
  }
}
