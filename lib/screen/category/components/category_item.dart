import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/domain/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(kDefaultPadding / 2),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/Todo",
              arguments: category);
          },
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0, color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 3),
              child: Center(
                  child: Text(
                '${category.categoryName}',
                style: CustomTextStyle.title2(context),
              )),
            ),
          ),
        ));
  }
}
