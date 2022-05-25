import 'package:flutter/material.dart';

TextTheme textTheme(BuildContext context){
  return Theme.of(context).textTheme;
}

Widget inkWell({Function()? onPressed, required Widget child}) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: onPressed,
    child: child,
  );
}
