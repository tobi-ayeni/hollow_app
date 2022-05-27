String pattern = r'^(?=.*?[!@#\$&*~)(%^])';
String pattern2 = r'^(?=.*?[0-9])';
RegExp regExp = RegExp(pattern);
RegExp regExp2 = RegExp(pattern2);

mixin ValidationMixin {
  bool isFieldEmpty(String value) => value.isEmpty;

  bool isMoreThanEight(String value) => value.length > 7;

  bool hasSpecialCharacters(String value) => regExp.hasMatch(value);

  bool hasANumber(String value) => regExp2.hasMatch(value);
}
