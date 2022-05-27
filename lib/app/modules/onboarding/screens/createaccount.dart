import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/app/modules/components/buttons.dart';
import 'package:hollow/app/modules/components/text_field_component.dart';
import 'package:hollow/app/modules/dashboard/screens/tab_layout.dart';
import 'package:hollow/app/modules/onboarding/bloc/on_boarding_bloc.dart';
import 'package:hollow/app/modules/onboarding/providers/auth_repository.dart';
import 'package:hollow/app/modules/onboarding/providers/form_submission_status.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';
import 'package:hollow/utils/strings.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);

  bool check = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                key: const Key("scrollView"),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kMediumPadding,
                      top: kFullPadding,
                      right: kMediumPadding,
                      bottom: kMediumPadding),
                  child: BlocProvider(
                    create: (context) => OnBoardingBloc(
                        authRepo: context.read<AuthRepository>()),
                    child: _signUpForm(context),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: SvgPicture.asset(AssetPaths.createLogo),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpForm(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        final formStatus = state.formStatus;

        if (formStatus is SubmissionSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const TabLayout()),
              (route) => false);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Text(
                createAccountString,
                style: textTheme(context).headline1,
              ),
            ),
            const SizedBox(
              height: kRegularPadding,
            ),
            Text(
              createAccountSub,
              style: textTheme(context).headline2,
            ),
            const SizedBox(
              height: kLargePadding,
            ),
            _nameField(),
            _lastNameField(),
            _userNameField(),
            _phoneField(),
            _emailField(),
            _passwordField(),
            BlocBuilder<OnBoardingBloc, OnBoardingState>(
              builder: (context, state) {
                return Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: state.isPasswordEightCharacters
                                ? kColorGreen
                                : Colors.grey),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: state.isPasswordEightCharacters
                              ? kColorGreen
                              : kPrimaryWhite,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: kSmallPadding,
                    ),
                    Text(
                      eightCharacters,
                      style: textTheme(context).subtitle1,
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: kSmallPadding,
            ),
            BlocBuilder<OnBoardingBloc, OnBoardingState>(
              builder: (context, state) {
                return Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: state.hasSpecialCharacters
                                  ? kColorGreen
                                  : Colors.grey)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: state.hasSpecialCharacters
                              ? kColorGreen
                              : kPrimaryWhite,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: kSmallPadding,
                    ),
                    Text(
                      containSpecialCharacter,
                      style: textTheme(context).subtitle1,
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: kSmallPadding,
            ),
            BlocBuilder<OnBoardingBloc, OnBoardingState>(
              builder: (context, state) {
                return Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: state.hasANumber
                                  ? kColorGreen
                                  : Colors.grey)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: state.hasANumber ? kColorGreen : kPrimaryWhite,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: kSmallPadding,
                    ),
                    Text(
                      containNumber,
                      style: textTheme(context).subtitle1,
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: kMacroPadding,
            ),
            BlocBuilder<OnBoardingBloc, OnBoardingState>(
              builder: (context, state) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inkWell(
                      onPressed: () {
                        check = !check;
                        context.read<OnBoardingBloc>().add(
                              OnCheckButton(check),
                            );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kPadding),
                          color: state.isTermsChecked
                              ? kCheckBoxActiveColor
                              : kCheckBoxInActiveColor,
                          border: Border.all(
                            width: 1,
                            color: state.isTermsChecked
                                ? kColorGreen
                                : kCheckBoxInActive,
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 15,
                          color:
                              state.isTermsChecked ? kColorGreen : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: kSmallPadding),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            text: terms,
                            style: textTheme(context).headline3,
                            children: [
                              TextSpan(
                                text: termsOfService,
                                style: textTheme(context)
                                    .headline3!
                                    .copyWith(color: kColorGreen),
                              ),
                              TextSpan(
                                  text: andString,
                                  style: textTheme(context).headline3),
                              TextSpan(
                                text: cardHolderAgreement,
                                style: textTheme(context)
                                    .headline3!
                                    .copyWith(color: kColorGreen),
                              ),
                            ]),
                      ),
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: kFullPadding,
            ),
            signUpButton(context),
            const SizedBox(
              height: kMediumPadding,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: gotAnAccount,
                    style: textTheme(context)
                        .headline2!
                        .copyWith(fontWeight: FontWeight.normal),
                    children: [
                      TextSpan(
                        text: signIn,
                        style: textTheme(context).headline2!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: kColorGreen,
                            decoration: TextDecoration.underline),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? const CircularProgressIndicator()
            : ButtonWidget(
                buttonText: createNewAccount,
                textColor: kPrimaryWhite,
                backGroundColor: (state.isPasswordEightCharacters &&
                        state.hasSpecialCharacters &&
                        state.hasANumber &&
                        check)
                    ? kBlueDeepColor
                    : kInactiveButtonColor,
                onPressed: () {
                  if (state.isPasswordEightCharacters &&
                      state.hasSpecialCharacters &&
                      state.hasANumber &&
                      check) {
                    context.read<OnBoardingBloc>().add(SIgnUpSubmitted());
                  }
                },
              );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: kSmallPadding),
          child: TextFieldComponent(
            hintText: hintPassword,
            inputType: TextInputType.text,
            onChanged: (val) {
              context.read<OnBoardingBloc>().add(
                    SignUpPasswordChanged(val!),
                  );
            },
          ),
        );
      },
    );
  }

  Widget _emailField() {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: kMediumPadding),
          child: TextFieldComponent(
            hintText: hintEmailAddress,
            inputType: TextInputType.emailAddress,
            onChanged: (val) => context.read<OnBoardingBloc>().add(
                  SignUpEmailChanged(val!),
                ),
          ),
        );
      },
    );
  }

  Widget _phoneField() {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: kMediumPadding),
          child: TextFieldComponent(
            hintText: hintPhoneNumber,
            inputType: TextInputType.phone,
            onChanged: (val) => context.read<OnBoardingBloc>().add(
                  SignUpPhoneChanged(val!),
                ),
          ),
        );
      },
    );
  }

  Widget _userNameField() {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: kMediumPadding),
          child: TextFieldComponent(
            hintText: hintUserName,
            inputType: TextInputType.text,
            onChanged: (val) => context.read<OnBoardingBloc>().add(
                  SignUpUserNameChanged(val!),
                ),
          ),
        );
      },
    );
  }

  Widget _lastNameField() {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: kMediumPadding),
          child: TextFieldComponent(
            hintText: hintLastName,
            inputType: TextInputType.text,
            onChanged: (val) => context.read<OnBoardingBloc>().add(
                  SignUpLastNameChanged(val!),
                ),
          ),
        );
      },
    );
  }

  Widget _nameField() {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: kMediumPadding),
          child: TextFieldComponent(
            hintText: hintName,
            inputType: TextInputType.text,
            onChanged: (val) => context.read<OnBoardingBloc>().add(
                  SignUpNameChanged(val!),
                ),
          ),
        );
      },
    );
  }
}
