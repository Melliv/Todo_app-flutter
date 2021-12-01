import 'package:flutter/material.dart';
import 'package:todo_app_flutter/components/default_header.dart';
import 'package:todo_app_flutter/screen/category/components/categories_display.dart';
import 'package:todo_app_flutter/screen/category/components/category_make.dart';
import 'package:todo_app_flutter/constants.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(color: kBackgroundColor),
        alignment: Alignment.center,
        child: Column(
          children: [
            DefaultHeader(),
            CategoryMake(),
            CategoriesDisplay(),
          ],
        ),
      ),
    ));
  }
}
