part of 'on_boarding_bloc.dart';

@immutable
abstract class OnBoardingEvent {

}

class SignUpNameChanged extends OnBoardingEvent{
final String name;
SignUpNameChanged(this.name);
}

class SignUpLastNameChanged extends OnBoardingEvent{
  final String lastName;
  SignUpLastNameChanged(this.lastName);
}

class SignUpUserNameChanged extends OnBoardingEvent{
  final String userName;
  SignUpUserNameChanged(this.userName);
}

class SignUpPhoneChanged extends OnBoardingEvent{
  final String phone;
  SignUpPhoneChanged(this.phone);
}

class SignUpEmailChanged extends OnBoardingEvent{
  final String email;
  SignUpEmailChanged(this.email);
}

class SignUpPasswordChanged extends OnBoardingEvent{
  final String password;
  SignUpPasswordChanged(this.password);
}

class SIgnUpSubmitted extends OnBoardingEvent{}

class OnCheckButton extends OnBoardingEvent{
  final bool isChecked;

  OnCheckButton(this.isChecked);
}

