import 'package:flutter/material.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/utils/constants.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final Function(String?)? onSaved;
  final TextInputType inputType;

  const TextFieldComponent({Key? key, required this.hintText, this.onSaved, required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textTheme(context).headline2!.copyWith(color: kPrimaryColor),
      onSaved: onSaved,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            textTheme(context).headline2!.copyWith(color: kHintTextColor),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kBorderColor),
          borderRadius: kBorderSmallRadius,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kColorGreen),
          borderRadius: kBorderSmallRadius,
        ),
      ),
    );
  }
}
