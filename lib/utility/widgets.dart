import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';

InputDecoration buildInputDecoration(
    BuildContext context, String hintText, IconData icon) {

  return InputDecoration(
    hintText: hintText,
    hintStyle: CustomTextStyle.hintField(context),
    errorStyle: CustomTextStyle.error(context),
    prefixIcon: Icon(icon, color: Colors.white),
  );
}

InputDecoration buildInputDecorationDark(
    BuildContext context, String hintText, IconData icon) {

  return InputDecoration(
    hintText: hintText,
    hintStyle: CustomTextStyle.hintField(context),
    errorStyle: CustomTextStyle.error(context),
    prefixIcon: Icon(icon, color: Colors.black),
  );
}

