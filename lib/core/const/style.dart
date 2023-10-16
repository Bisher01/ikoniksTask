import 'package:flutter/material.dart';

abstract class AppStyle {

  //colors
  static const Color whiteColor = Colors.white;
  static const Color lightGreyColor = Color(0xFFD9D9D9);
  static const Color greyColor = Color(0xFF8F8989);
  static const Color shadowColor = Color(0x3F000000);
  static const Color blackColor = Colors.black;

  static const Color primaryColor = Color(0xFF63B2F2);
  static const Color darkBlueColor = Color(0xFF0D47A1);

  static const Color lightRedColor = Color(0xFFF26363);
  static const Color redColor = Color.fromRGBO(206, 55, 45, 1);

  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        dividerColor: greyColor,
        scaffoldBackgroundColor: whiteColor,
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: primaryColor,
          background: Color(0xFFFFFFFF),
        ),
        fontFamily: '',
        textTheme: const TextTheme(
          displayMedium: TextStyle(
              fontFamily: 'Inter',
              fontSize: 34,
              fontWeight: AppFontWeight.semiBold),
          headlineLarge: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32,
              fontWeight: AppFontWeight.semiBold),
          headlineSmall: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: AppFontWeight.medium),
          titleLarge: TextStyle(
              fontFamily: 'Inter',
              fontSize: 22,
              fontWeight: AppFontWeight.medium),
          titleMedium: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: AppFontWeight.medium),
          titleSmall: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: AppFontWeight.medium),
          bodyLarge: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: AppFontWeight.medium),
          bodyMedium: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: AppFontWeight.medium),
          bodySmall: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: AppFontWeight.medium),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: whiteColor),
          titleTextStyle: TextStyle(color: whiteColor, fontSize: 20),
          backgroundColor: primaryColor,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          hintStyle: TextStyle(color: blackColor.withOpacity(0.5)),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: darkBlueColor, width: 1.5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: greyColor, width: 1.5),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: greyColor, width: 1.5),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: greyColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: redColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: redColor),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ),
      );
}

abstract class AppFontWeight {
  static const FontWeight medium = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w800;
}
