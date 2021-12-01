import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/components/add_button.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/priority.dart';
import 'package:todo_app_flutter/providers/priority_provider.dart';
import 'package:todo_app_flutter/services/base_service.dart';
import 'package:todo_app_flutter/utility/widgets.dart';

class PriorityForm extends StatefulWidget {
  const PriorityForm({Key? key}) : super(key: key);

  @override
  _PriorityFormState createState() => _PriorityFormState();
}

class _PriorityFormState extends State<PriorityForm> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Priority priority = Priority();

    Future<void> submit() async {
      final form = _formKey.currentState!;
      if (!form.validate()) {
        return;
      }
      form.save();

      var response = await BaseService.postE("TodoPriorities", priority);

      if (response.ok) {
        priority.fromJson(response.data!);

        Provider.of<PriorityProvider>(context, listen: false)
            .addPriority(priority);

        form.reset();
        setState(() {
          priority = Priority();
        });
      } else {
        print("error! :(");
        print(response.messages);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
            key: _formKey,
            child: Container(
              width: size.width * 0.6,
              child: TextFormField(
                  style: CustomTextStyle.formFieldDark(context),
                  onSaved: (value) => priority.priorityName = value!,
                  validator: (value) {
                    return (value!.isEmpty) ? "Priority is required!" : null;
                  },
                  decoration: buildInputDecorationDark(
                      context, "Priority", Icons.task)),
            )),
        AddButton(press: () async {
          await submit();
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        })
      ],
    );
  }
}
