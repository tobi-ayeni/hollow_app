
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hollow/app/modules/onboarding/providers/auth_repository.dart';
import 'package:hollow/app/modules/onboarding/providers/form_submission_status.dart';
import 'package:hollow/app/modules/onboarding/service/vlidation_mixin.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> with ValidationMixin {
  final AuthRepository? authRepo;


  OnBoardingBloc({this.authRepo}) : super(OnBoardingState()){
    on<SignUpNameChanged>((event, emit) async {
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
      // state.copyWith(password: event.password);
      print(event.password);
      // if(isMoreThanEight(event.password)) {
      //   emit( state.copyWith(password: event.password, formStatus: PasswordCharacters()));
      // }else{
      //   emit( state.copyWith(password: event.password,formStatus: PasswordCharactersFailed()));
      // }
      // if(hasANumber(event.password)){
      //   emit( state.copyWith(formStatus: PasswordNumber()));
      // }else{
      //   emit( state.copyWith(formStatus: PasswordNumberFailed()));
      // }
      // if(hasSpecialCharacters(event.password)){
      //   emit( state.copyWith(formStatus: PasswordSpecialCharacter()));
      // }
      // else{
      //   emit (state.copyWith(formStatus: PasswordSpecialCharacterFailed()));
      //
      // }
      // emit(state.copyWith(name: event.password,));
    });

    on<OnCheckButton>((event, emit) async{
      emit(state.copyWith(isChecked: event.isChecked));
      print("is checked${event.isChecked}");
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
