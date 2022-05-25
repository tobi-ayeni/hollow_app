import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Env {
  static late EnvState _env;

  static void setEnvironment(EnvState environment) {
    _env = environment;
  }

  static EnvState getEnvironment() {
    return _env;
  }
}

enum EnvState { test, production }

Duration requestDuration = const Duration(seconds: 60);

RegExp onlyTextValues = RegExp(r'[a-zA-Z]');

bool isEmail(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  } else {
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }
}

bool isValidName(String? name) {
  if (name == null || name.isEmpty) {
    return false;
  } else {
    String n = r"^[\\p{L} .'-]+$";
    RegExp regExp = RegExp(n);

    return regExp.hasMatch(name);
  }
}

String? validateField(String? text, {required String result}) {
  if (text == null || text.isEmpty) {
    return result;
  } else {
    return null;
  }
}

// Spacing
const double kPadding = 5;
const double kSmallPadding = 10;
const double kRegularPadding = 15;
const double kMediumPadding = 20;
const double kMacroPadding = 30;
const double kLargePadding = 40;
const double kFullPadding = 60;
const double kSupremePadding = 100;

const double kWidthRatio = 0.9;
const double kIconSize = 24;

double kCalculatedWidth(Size size) => size.width * kWidthRatio;
double kCalculatedMargin(Size size) => size.width * (1 - kWidthRatio) / 2;

// Colors
const Color kPrimaryColor = Color(0xff212327);
const Color kPrimaryGrey700 = Color(0xff444B59);
const Color kHintTextColor = Color(0xFF667085);
const Color kBorderColor = Color(0xffCCCFD6);
const Color kTermsColor = Color(0xff333843);
const Color kColorGreen = Color(0xFF1B9B48);
const Color kCheckBoxInActive = Color(0xFFCACBCB);
const Color kCheckBoxInActiveColor = Color(0xFFFBFBFB);
const Color kCheckBoxActiveColor = Color(0xFFF2F4F3);
const Color kPrimaryWhite = Colors.white;
const Color kInactiveButtonColor = Color(0xFFB1B4BF);
const Color kFlushBarColor = Color(0xFF141D3E);
const Color kBlueDeepColor = Color(0xFF111834);
const Color kFlushBarBackGround = Color(0xFFF9F8FF);
const Color kIconColor = Color(0xFFB3B8C2);
const Color kGreyBackground = Color(0xFF62687E);
const Color kCardInfoColor = Color(0xFFFCFDFD);
const Color kTransparent = Colors.transparent;
const Color kGreenColor = Color(0xFF17813C);
const Color kHomeOrangeColor = Color(0xFFFDEEDC);
const Color kHomeOrangeColor200 = Color(0xFFFEF4E9);
const Color kHomeBlueColor = Color(0xFFE0E6FD);
const Color kHomePurpleColor = Color(0xFFEEE9FE);
const Color kHomePurpleColor200 = Color(0xFFE4DEFD);
const Color kHomePurpleColor300 = Color(0xFFFAFAFB);
const Color kDeepGreyColor = Color(0xFF797A7A);








// Border
const double kBorderWidth = 1;
const double kThickBorderWidth = 3;
const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(kPadding));
const BorderRadius kBorderSmallRadius =
BorderRadius.all(Radius.circular(kSmallPadding));
const BorderRadius kBorderMidRadius =
BorderRadius.all(Radius.circular(kRegularPadding));
const BorderRadius kFullBorderRadius = BorderRadius.all(Radius.circular(100));
BoxDecoration kTextFieldBoxDecoration = const BoxDecoration(
    borderRadius: kBorderRadius, border: null, color: Colors.white);
BoxDecoration kBottomSheetBoxDecoration = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  ),
);

InputBorder borderDesign = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.blueGrey,
  ),
);

InputBorder errorBorderDesign = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

BoxShadow kBoxShadow(Color color) => BoxShadow(
  color: color,
  spreadRadius: 5,
  blurRadius: 7,
  offset: Offset(0, 2), // changes position of shadow
);

BoxShadow kBoxShadowMid(Color color) => BoxShadow(
  color: color,
  spreadRadius: 2,
  blurRadius: 4,
  offset: Offset(0, 5), // changes position of shadow
);

BoxShadow kBoxShadowCondensed(Color color) => BoxShadow(
  color: color,
  spreadRadius: 1,
  blurRadius: 1,
  offset: Offset(0, 3), // changes position of shadow
);

// Text
TextStyle kHeadline1TextStyle = const TextStyle(
  fontFamily: "Karla",
  fontWeight: FontWeight.normal,
  color: kPrimaryColor,
  fontSize: 32,
);

TextStyle kHeadline2TextStyle = const TextStyle(
  fontFamily: "Rubik",
  fontWeight: FontWeight.normal,
  color: kPrimaryGrey700,
  fontSize: 18,
);
TextStyle kHeadline3TextStyle = const TextStyle(
  fontFamily: "Rubik",
  fontWeight: FontWeight.normal,
  color: kTermsColor,
  fontSize: 16,
);

TextStyle kHeadline4TextStyle = const TextStyle(
  fontFamily: "Karla",
  fontWeight: FontWeight.w500,
  color: kCardInfoColor,
  fontSize: 20,
);

TextStyle kBodyText1Style = const TextStyle(
  fontFamily: "Karla",
  fontWeight: FontWeight.w700,
  color: kCardInfoColor,
  fontSize: 42,
);

TextStyle kBodyText2Style = const TextStyle(
  fontFamily: "Rubik",
  fontWeight: FontWeight.w600,
  color: kFlushBarColor,
  fontSize: 14,
);

TextStyle kSubtitle1Style = const TextStyle(
  fontFamily: "DMSans",
  fontWeight: FontWeight.w400,
  color: kBorderColor,
  fontSize: 14,
);

TextStyle kSubtitle2Style = const TextStyle(
  fontFamily: "DMSans",
  fontWeight: FontWeight.w600,
  color: kBorderColor,
  fontSize: 12,
);

ThemeData kThemeData = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: kPrimaryWhite,
  iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryColor),
  primaryColor: kPrimaryColor,
  canvasColor: kPrimaryWhite,
  backgroundColor: kPrimaryWhite,
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: kPrimaryColor,
    cursorColor: kPrimaryColor,
  ),
  dialogBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: kPrimaryWhite,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryColor),
    titleTextStyle: kBodyText1Style,
  ),
  textTheme: TextTheme(
    headline1: kHeadline1TextStyle,
    headline2: kHeadline2TextStyle,
    headline3: kHeadline3TextStyle,
    headline4: kHeadline4TextStyle,
    bodyText1: kBodyText1Style,
    bodyText2: kBodyText2Style,
    subtitle1: kSubtitle1Style,
    subtitle2: kSubtitle2Style,
  ),
);
