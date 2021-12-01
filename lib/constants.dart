import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0C9869);
const kSecondaryColor = Color(0xFF89a832);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFF24bf54);
const double kDefaultPadding = 20.0;

class CustomTextStyle {
  static TextStyle formField(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle formFieldDark(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black);
  }

  static TextStyle hintField(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.grey);
  }

  static TextStyle title2(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 24, fontWeight: FontWeight.normal, color: Colors.black);
  }

  static TextStyle title2withLineThrough(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        decoration: TextDecoration.lineThrough);
  }

  static TextStyle error(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.red);
  }

  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle subTitle(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle button(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle body(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }
}
