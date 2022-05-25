import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';

// void showErrorBar(BuildContext context, String value) {
//   String _message;
//   if (value.contains("not supported")) {
//     _message = value.split(".").first;
//   } else {
//     _message = value;
//   }
//   Flushbar(
//     message: _message,
//     messageColor: kColorRed,
//     flushbarPosition: FlushbarPosition.BOTTOM,
//     backgroundColor: kColorBackgroundRed,
//     borderRadius: kBorderSmallRadius,
//     borderWidth: 1,
//     borderColor: kColorRed,
//     icon: const Icon(
//       CupertinoIcons.multiply_circle_fill,
//       color: kColorRed,
//     ),
//     mainButton: InkWell(
//       onTap: () => Navigator.pop(context),
//       child: const Icon(
//         Icons.close_rounded,
//         color: kColorRed,
//       ),
//     ),
//     margin: const EdgeInsets.all(20),
//     padding: const EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
//     duration: const Duration(seconds: 2),
//   ).show(context);
// }

void showPendingBar(BuildContext context, String? value) {
  if (value != null) {
    Flushbar(
      messageSize: 68,
      messageColor: kFlushBarColor,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: kFlushBarBackGround,
      borderRadius: kBorderSmallRadius,
      icon: SvgPicture.asset(AssetPaths.warningIcon),
      borderWidth: 1,
      messageText: Text(
        value,
        style: textTheme(context).headline3!.copyWith(
              color: kFlushBarColor,
              fontWeight: FontWeight.w600,
            ),
      ),
      borderColor: kFlushBarColor,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
