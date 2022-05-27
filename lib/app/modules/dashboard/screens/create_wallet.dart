import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/app/modules/components/buttons.dart';
import 'package:hollow/app/modules/dashboard/models/home_model.dart';
import 'package:hollow/app/modules/dashboard/screens/search_wallet.dart';
import 'package:hollow/app/navigators/navigators.dart';
import 'package:hollow/utils/constants.dart';
import 'package:hollow/utils/strings.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({Key? key}) : super(key: key);

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  String? _wallet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: inkWell(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: kDeepGreyColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    createWalletText,
                    style: textTheme(context).headline1!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                  ),
                  const SizedBox(
                    height: kSmallPadding,
                  ),
                  Text(
                    createWalletTextSub,
                    style: textTheme(context).headline2,
                  ),
                  const SizedBox(
                    height: kMacroPadding,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonHideUnderline(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kRegularPadding, vertical: kPadding),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kBorderColor)),
                        child: DropdownButton2(
                          dropdownElevation: 0,
                          dropdownWidth: MediaQuery.of(context).size.width - 20,
                          dropdownDecoration: BoxDecoration(
                              border: Border.all(color: kBorderColor),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(kSmallPadding),
                                bottomRight: Radius.circular(kSmallPadding),
                              )),
                          hint: Text(
                            chooseWallet,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          style: textTheme(context)
                              .headline2!
                              .copyWith(color: kHintTextColor),
                          items: walletTypes
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: textTheme(context).headline2),
                                  ))
                              .toList(),
                          value: _wallet,
                          onChanged: (value) {
                            setState(() {
                              _wallet = value as String;
                            });
                          },
                        ),
                      ),
                    ),
                  ), // DropdownButtonFormField(
                ],
              ),
            ),
            ButtonWidget(
              onPressed: () {
                pushTo(context, SearchWallet());
              },
              buttonText: proceed,
              textColor: kPrimaryWhite,
              backGroundColor: _wallet == "Fiat Wallet" ? kBlueDeepColor :  kInactiveButtonColor,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
