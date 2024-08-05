// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';
import 'package:zajil_v2/src/config/theme/hexcolor.dart';
import 'package:zajil_v2/src/config/utils/app_strings.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: AppStrings.fontFamily,
      appBarTheme: AppBarTheme(
          backgroundColor: HexColor("FFFFFF"),
          foregroundColor: HexColor("FFFFFF"),
          surfaceTintColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black)),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Color(0xff2b2b2b)),
      primaryColor: ColorsManager.primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.white,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: HexColor("FFFFFF"),

      cardColor: Colors.white,
      //   buttonColor: Color(primaryColor),

      platform: TargetPlatform.iOS,
      shadowColor: Colors.black,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(ColorsManager.primaryColor))),
      indicatorColor: ColorsManager.primaryColor,
      disabledColor: Colors.black.withOpacity(0.1),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              //  textStyle: getRegularStyle(color: Colors.white, fontSize: 17),
              backgroundColor: ColorsManager.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          // content padding
          contentPadding: const EdgeInsets.all(8),

          // hint style
          // hintStyle: font16WhiteSemiBold,
          // labelStyle: font16WhiteSemiBold,
          // floatingLabelStyle:
          //     getRegularStyle(color: HexColor('8391A1'), fontSize: 12),
          // errorStyle: getRegularStyle(color: ColorsManager.error),
          suffixIconColor: HexColor('6A707C'),
          prefixIconColor: HexColor('6A707C'),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 1),
              borderRadius: BorderRadius.circular(25)),
          // enabled border style
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('E8ECF4'), width: 1),
              borderRadius: BorderRadius.circular(25)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('E8ECF4'), width: 1),
              borderRadius: BorderRadius.circular(25)),
          // focused border style
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsManager.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(25)),

          // error border style
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.error, width: 1.5),
              borderRadius: BorderRadius.circular(25)),
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsManager.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(25))),

      // label style
    );
  }
}
