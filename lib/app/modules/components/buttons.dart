import 'package:flutter/material.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/utils/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color backGroundColor, textColor;
  final Function() onPressed;

  const ButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.textColor,
      required this.backGroundColor, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return inkWell(
      onPressed: onPressed,
      child: Container(
        height: 56,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(kSmallPadding),
        ),
        child: Text(
          buttonText,
          style: textTheme(context)
              .headline2!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
