import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollow/app/modules/onboarding/providers/auth_repository.dart';
import 'package:hollow/app/modules/onboarding/screens/createaccountmodified.dart';
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
        home: RepositoryProvider(
          create: (context)=>AuthRepository(),
          child:  CreateAccount(),
        ));
  }
}
