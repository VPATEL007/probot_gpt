import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color txt;
  Color primary;
  Color primaryLight;
  Color primaryLight1;
  Color primaryShadow;
  Color secondary;
  Color accentTxt;
  Color bg1;
  Color surface;
  Color error;
  Color main;
  Color darkText;
  Color lightText;
  Color icon;
  Color clickableText;
  Color boxBg;
  Color mainBg;
  Color white;
  Color linerGradiant;
  Color indicator;
  Color mainLight;
  Color dash;
  Color divider;
  Color trans;
  Color black;
  Color yellow;
  Color sameWhite;
  Color sameBlack;
  Color borderColor;
  Color toggleSwitch;
  Color trackActive;
  Color radialGradient;
  Color bg;
  Color textField;
  Color greyLight;
  Color redColor;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.txt,
    required this.primary,
    required this.primaryLight,
    required this.primaryLight1,
    required this.primaryShadow,
    required this.secondary,
    required this.accentTxt,
    required this.bg1,
    required this.surface,
    required this.error,
    required this.main,
    required this.darkText,
    required this.lightText,
    required this.icon,
    required this.clickableText,
    required this.boxBg,
    required this.mainBg,
    required this.white,
    required this.linerGradiant,
    required this.indicator,
    required this.mainLight,
    required this.dash,
    required this.divider,
    required this.black,
    required this.trans,
    required this.yellow,
    required this.sameWhite,
    required this.sameBlack,
    required this.borderColor,
    required this.toggleSwitch,
    required this.trackActive,
    required this.radialGradient,
    required this.bg,
    required this.textField,
    required this.greyLight,
    required this.redColor,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          txt: const Color(0xFF323444),
          primary: const Color(0xFF0D2232),
          primaryLight: const Color.fromRGBO(53, 193, 255, 0.1),
          primaryLight1: const Color.fromRGBO(53, 193, 255, 0.2),
          primaryShadow: const Color.fromRGBO(53, 193, 255, 0.06),
          secondary: const Color(0xFF0D2232),
          accentTxt: const Color(0xFF001928),
          bg1: const Color(0xFF0D2232),
          surface: const Color(0xFF0D2232),
          error: const Color(0xFFd32f2f),
          icon: const Color(0xff3E9B0E),
          main: const Color(0xff0d2235),
          darkText: const Color(0xff414449),
          lightText: const Color(0xffffffff),
          clickableText: const Color(0xff4D66FF),
          mainBg: const Color(0x00fff0e3),
          boxBg: const Color(0xFF0D2232),
          white: const Color(0xFFFFFFFF),
          linerGradiant: const Color(0xff848485),
          indicator: const Color(0xffDFDFDF),
          mainLight: const Color(0xffFFF0E3),
          dash: const Color(0xffD6D6D6),
          divider: const Color(0xffEBEBEB),
          trans: Colors.transparent,
          black: Colors.black,
          yellow: const Color(0xffFFB931),
          sameWhite: Colors.white,
          sameBlack: Colors.black,
          borderColor: const Color.fromRGBO(53, 193, 255, 0.08),
          toggleSwitch: const Color(0xffF5F5F5),
          trackActive: const Color(0xffFFF0E3),
          radialGradient: const Color(0xff179EEA),
          bg: const Color(0xff4D4F5D),
          textField: const Color(0xffF5F5F6),
          greyLight: const Color.fromRGBO(50, 52, 68, 0.1),
          redColor: const Color(0XFFFE3D3D),
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          txt: Colors.white,
          primary: const Color(0xff35C1FF),
          primaryLight: const Color.fromRGBO(53, 193, 255, 0.1),
          primaryLight1: const Color.fromRGBO(53, 193, 255, 0.2),
          primaryShadow: const Color(0xFF323444),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          bg1: const Color(0xFF323444),

          surface: const Color(0xFF4D4F5D),
          // add

          error: const Color(0xFFd32f2f),
          icon: const Color(0xff3E9B0E),
          main: const Color(0xff0d2235),
          darkText: const Color(0xffF5F5F5),
          lightText: const Color(0xffAFB0B6),
          clickableText: const Color(0xff4D66FF),
          mainBg: const Color(0x00fff0e3),
          boxBg: const Color(0xff3E404F),
          white: const Color(0xff2A2A2A),
          linerGradiant: const Color(0xff848485),
          indicator: const Color(0xffDFDFDF),
          mainLight: const Color(0xffFFF0E3),
          dash: const Color(0xffD6D6D6),
          divider: const Color(0xffEBEBEB),
          trans: Colors.transparent,
          black: Colors.white,
          yellow: const Color(0xffFFB931),
          sameWhite: Colors.white,
          sameBlack: Colors.black,

          borderColor: const Color(0xFF323444),

          toggleSwitch: const Color(0xff2A2A2A),
          trackActive: const Color(0xff4E3B2B),
          radialGradient: const Color(0xff179EEA),
          bg: const Color(0xff4D4F5D),
          textField: const Color(0xff4D4F5D),
          greyLight: const Color.fromRGBO(50, 52, 68, 0.1),
          redColor: const Color(0XFFFE3D3D),
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: secondary,
        background: bg1,
        surface: surface,
        onBackground: white,
        onSurface: white,
        onError: white,
        onPrimary: white,
        onSecondary: white,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primary),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
    );
  }
}

class fontfamily {

}
