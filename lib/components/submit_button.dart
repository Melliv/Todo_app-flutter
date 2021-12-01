import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.submitText,
    required this.press,
  }) : super(key: key);

  final String submitText;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                submitText,
                textAlign: TextAlign.center,
                style: CustomTextStyle.button(context),
              ),
            )
          ],
        ),
        onPressed: () => {press()},
      ),
    );
  }
}
