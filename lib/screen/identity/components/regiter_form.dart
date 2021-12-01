import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/components/submit_button.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/register.dart';
import 'package:todo_app_flutter/domain/user.dart';
import 'package:todo_app_flutter/providers/auth_provider.dart';
import 'package:todo_app_flutter/providers/user_provider.dart';
import 'package:todo_app_flutter/utility/validator.dart';
import 'package:todo_app_flutter/utility/widgets.dart';

class RegisterForm extends StatefulWidget {
  @override
  createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    Register register = Register();

    Future<void> submit() async {
      final form = _formKey.currentState!;
      if (!form.validate()) {
        return;
      }
      form.save();

      Map<String, dynamic> response = await auth.register(register);

      if (response["status"]) {
        User user = User.fromJson(response);

        Provider.of<UserProvider>(context, listen: false).setUser(user);

        Navigator.pushReplacementNamed(context, '/Category');
      } else {
        print("error! :(");
      }
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  style: CustomTextStyle.formField(context),
                  onSaved: (value) => register.firstName = value!,
                  validator: (value) {
                    return (value!.isEmpty)
                        ? "Your first name is required"
                        : null;
                  },
                  decoration: buildInputDecoration(
                      context, "First Name", Icons.text_fields)),
              TextFormField(
                  style: CustomTextStyle.formField(context),
                  onSaved: (value) => register.lastName = value!,
                  validator: (value) {
                    return (value!.isEmpty)
                        ? "Your last name is required"
                        : null;
                  },
                  decoration: buildInputDecoration(
                      context, "Last Name", Icons.text_fields)),
              TextFormField(
                  style: CustomTextStyle.formField(context),
                  onSaved: (value) => register.email = value!,
                  validator: (value) => validateEmail(value!),
                  decoration:
                      buildInputDecoration(context, "Email", Icons.email)),
              TextFormField(
                style: CustomTextStyle.formField(context),
                onSaved: (value) => register.password = value!,
                validator: (value) => validatePassword(value!),
                decoration:
                    buildInputDecoration(context, "Password", Icons.lock),
                obscureText: true,
              ),
              SizedBox(height: 20),
              SubmitButton(
                press: submit,
                submitText: 'Sign In',
              ),
            ],
          ),
        ));
  }
}
