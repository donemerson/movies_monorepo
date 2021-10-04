import 'package:flutter/material.dart';
import '../../../resources/resources.dart';

ThemeData makeAppTheme() {
  const primaryColor = MyColors.primary;
  const primaryColorDark = MyColors.primary;
  const primaryColorLight = MyColors.primary;

  const secondaryColor = MyColors.secondary;
  const secondaryColorDark = MyColors.secondary;

  const disabledColor = MyColors.sombra2;
  const dividerColor = MyColors.sombra2;

  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.white,
      centerTitle: true,
    ),
    fontFamily: 'ProximaNova',
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    backgroundColor: MyColors.white,
    scaffoldBackgroundColor: MyColors.white,
    dialogBackgroundColor: MyColors.white,
  );
}
