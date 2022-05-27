
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hollow/app/modules/onboarding/providers/auth_repository.dart';
import 'package:hollow/app/modules/onboarding/providers/form_submission_status.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final AuthRepository? authRepo;


  OnBoardingBloc({this.authRepo}) : super(OnBoardingState()){
    on<SignUpNameChanged>((event, emit) async {
      emit(OnBoardingState());
      emit(state.copyWith(name: event.name,));
    });
    on<SignUpLastNameChanged>((event, emit) async {
      emit(state.copyWith(name: event.lastName,));
    });
    on<SignUpUserNameChanged>((event, emit) async {
      emit(state.copyWith(name: event.userName,));
    });
    on<SignUpPhoneChanged>((event, emit) async {
      emit(state.copyWith(name: event.phone,));
    });
    on<SignUpEmailChanged>((event, emit) async {
      emit(state.copyWith(name: event.email,));
    });
    on<SignUpPasswordChanged>((event, emit) async {
      emit(state.copyWith(password: event.password));
    });

    on<OnCheckButton>((event, emit) async{
      emit(state.copyWith(isChecked: event.isChecked));
    });

    on<SIgnUpSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepo!.login();
        emit (state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit( state.copyWith(formStatus: SubmissionFailed(e.toString())));
      }
    });
  }
}
