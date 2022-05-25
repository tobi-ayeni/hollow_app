import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/app/modules/components/buttons.dart';
import 'package:hollow/app/modules/components/text_field_component.dart';
import 'package:hollow/app/modules/dashboard/screens/tab_layout.dart';
import 'package:hollow/app/navigators/navigators.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';
import 'package:hollow/utils/strings.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kMediumPadding,
                      top: kFullPadding,
                      right: kMediumPadding,
                      bottom: kMediumPadding),
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
                      TextFieldComponent(
                        hintText: hintName,
                        onSaved: (val) {},
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      TextFieldComponent(
                        hintText: hintLastName,
                        onSaved: (val) {},
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      TextFieldComponent(
                        hintText: hintUserName,
                        inputType: TextInputType.text,
                        onSaved: (val) {},
                      ),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      TextFieldComponent(
                        hintText: hintPhoneNumber,
                        inputType: TextInputType.phone,
                        onSaved: (val) {},
                      ),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      TextFieldComponent(
                        hintText: hintEmailAddress,
                        inputType: TextInputType.emailAddress,
                        onSaved: (val) {},
                      ),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      TextFieldComponent(
                        hintText: hintPassword,
                        inputType: TextInputType.text,
                        onSaved: (val) {},
                      ),
                      const SizedBox(
                        height: kMacroPadding,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          inkWell(
                            onPressed: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kPadding),
                                color: isChecked
                                    ? kCheckBoxActiveColor
                                    : kCheckBoxInActiveColor,
                                border: Border.all(
                                  width: 1,
                                  color: isChecked
                                      ? kColorGreen
                                      : kCheckBoxInActive,
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 15,
                                color: isChecked ? kColorGreen : Colors.white,
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
                      ),
                      const SizedBox(
                        height: kFullPadding,
                      ),
                      ButtonWidget(
                        buttonText: createNewAccount,
                        textColor: kPrimaryWhite,
                        backGroundColor: kInactiveButtonColor,
                        onPressed: (){
                          pushTo(context, TabLayout());
                        },
                      ),
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
}
