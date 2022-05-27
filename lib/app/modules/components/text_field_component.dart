import 'package:flutter/material.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/utils/constants.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final Function(String?)? onChanged;
  final TextInputType inputType;
  final String valKey;


  const TextFieldComponent({Key? key, required this.hintText,required this.inputType, required this.onChanged, required this.valKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(valKey),
      style: textTheme(context).headline2!.copyWith(color: kPrimaryColor),
      keyboardType: inputType,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
