part of 'on_boarding_bloc.dart';

class OnBoardingInitial extends OnBoardingState {}

String pattern = r'^(?=.*?[!@#\$&*~)(%^_])';
String pattern2 = r'^(?=.*?[0-9])';
RegExp regExp = RegExp(pattern);
RegExp regExp2 = RegExp(pattern2);

class OnBoardingState extends Equatable {
  final String name;
  final String lastName;
  final String userName;
  final String phoneNumber;
  final String email;
  final String password;
  final bool isChecked;

  final FormSubmissionStatus formStatus;

  bool get isNameNotEmpty => name.isNotEmpty;

  bool get isLastNameNotEmpty => lastName.isNotEmpty;

  bool get isUserNameNotEmpty => userName.isNotEmpty;

  bool get isPhoneNumberNotEmpty => phoneNumber.isNotEmpty;

  bool get isEmailNotEmpty => email.isNotEmpty;

  bool get isTermsChecked => isChecked == true;

  bool get isPasswordEightCharacters => password.length > 7;

  bool get hasSpecialCharacters => regExp.hasMatch(password);

  bool get hasANumber => regExp2.hasMatch(password);

  const OnBoardingState({this.name = "",
    this.lastName = "",
    this.userName = "",
    this.phoneNumber = "",
    this.email = "",
    this.password = "",
    this.isChecked = false,
    this.formStatus = const InitialFormStatus()});

  OnBoardingState copyWith({String? name,
    String? lastName,
    String? userName,
    String? phoneNumber,
    String? email,
    String? password,
    bool? isChecked,
    final FormSubmissionStatus? formStatus}) {
    return OnBoardingState(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        password: password ?? this.password,
        isChecked: isChecked ?? false,
        formStatus: formStatus ?? this.formStatus);
  }


  @override
  // TODO: implement props

  List<Object?> get props {
    return [
      name,
      lastName,
      userName,
      phoneNumber,
      email,
      password,
      isChecked,
      formStatus
    ];
  }
}
