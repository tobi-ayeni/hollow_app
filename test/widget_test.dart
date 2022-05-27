// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hollow/app/modules/onboarding/bloc/on_boarding_bloc.dart';
import 'package:hollow/app/modules/onboarding/providers/auth_repository.dart';
import 'package:hollow/app/modules/onboarding/providers/form_submission_status.dart';

import 'package:hollow/main.dart';

class MockCounterBloc extends MockBloc<OnBoardingEvent, OnBoardingState>
    implements OnBoardingBloc {}

class MockCounterCubit extends MockCubit<OnBoardingState>
    implements OnBoardingBloc {}

AuthRepository repo = AuthRepository();
OnBoardingBloc blocs = OnBoardingBloc();

void main() {
  mainBloc();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

void mainBloc() {
  group("check Bloc", () {
    late OnBoardingBloc bloc;

    setUp(() {
      bloc = OnBoardingBloc();
    });

    test("check loading", () {
      expect(bloc.state, bloc.state);
    });

    blocTest<OnBoardingBloc, OnBoardingState>("check event",
        build: () => bloc,
        act: (submitBloc) => submitBloc.add(SIgnUpSubmitted()),
        expect: () => [
              OnBoardingState(formStatus:  FormSubmitting(),),
              OnBoardingState(formStatus: SubmissionSuccess(),
              )
            ]);
  });
}
