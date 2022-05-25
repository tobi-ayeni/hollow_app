import 'package:flutter/material.dart';
import 'package:hollow/app/modules/onboarding/screens/create_account.dart';
import 'package:hollow/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hollow App',
      theme: kThemeData,
      home: const CreateAccount()
    );
  }
}
