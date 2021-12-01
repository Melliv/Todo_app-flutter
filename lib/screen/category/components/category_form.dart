import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/components/add_button.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/category.dart';
import 'package:todo_app_flutter/providers/category_provider.dart';
import 'package:todo_app_flutter/services/base_service.dart';
import 'package:todo_app_flutter/utility/widgets.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm({Key? key}) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Category category = Category();

    Future<void> submit() async {
      final form = _formKey.currentState!;
      if (!form.validate()) {
        return;
      }
      form.save();

      var response = await BaseService.postE("TodoCategories", category);

      if (response.ok) {
        category.fromJson(response.data!);

        Provider.of<CategoryProvider>(context, listen: false)
            .addCategory(category);

        form.reset();
        setState(() {
          category = Category();
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
                  onSaved: (value) => category.categoryName = value!,
                  validator: (value) {
                    return (value!.isEmpty) ? "Description is required!" : null;
                  },
                  decoration: buildInputDecorationDark(
                      context, "Category name", Icons.task)),
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
