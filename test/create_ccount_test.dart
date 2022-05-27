

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hollow/app/modules/onboarding/providers/auth_repository.dart';
import 'package:hollow/app/modules/onboarding/screens/createaccount.dart';

void main() {
  MaterialApp app = MaterialApp(
      home: RepositoryProvider(
        create: (context)=>AuthRepository(),
        child:  CreateAccount(),
      )
  );

  testWidgets("Check widgets by key", (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byKey(const Key("scrollView")), findsOneWidget);
    expect(find.byKey(const Key("lastNameKey")), findsOneWidget);
    expect(find.byKey(const Key("nameKey")), findsOneWidget);
    expect(find.byKey(const Key("userNameKey")), findsOneWidget);
    expect(find.byKey(const Key("phoneKey")), findsOneWidget);
    expect(find.byKey(const Key("emailKey")), findsOneWidget);
    expect(find.byKey(const Key("passwordKey")), findsOneWidget);

    await tester.pump();
  });

}