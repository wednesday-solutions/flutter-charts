import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.compact,
  applyElevationOverlayColor: false,
  brightness: Brightness.light,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  canvasColor: const Color(0xFFFFFBFF),
  splashColor: const Color(0x66C8C8C8),
  primaryColor: const Color(0xFF4247E8),
  primaryColorDark: const Color(0xFF191FC8),
  primaryColorLight: const Color(0xFFBBDEFB),
  secondaryHeaderColor: const Color(0xFFE3F2FD),
  scaffoldBackgroundColor: const Color(0xFFFFFBFF),
  cardColor: const Color(0xFFFFFBFF),
  dialogBackgroundColor: const Color(0xFFFFFBFF),
  disabledColor: const Color(0x61000000),
  dividerColor: const Color(0x1F1B1B1F),
  focusColor: const Color(0x1F000000),
  highlightColor: const Color(0x66BCBCBC),
  hintColor: const Color(0x99000000),
  hoverColor: const Color(0x0A000000),
  indicatorColor: const Color(0xFFFFFFFF),
  shadowColor: const Color(0xFF000000),
  unselectedWidgetColor: const Color(0x8A000000),
  colorScheme: _colorScheme,
  primaryIconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
  iconTheme: const IconThemeData(color: Color(0xDD000000)),
  primaryTextTheme: TextTheme(
    bodyLarge: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 16.dp,
      inherit: false,
      letterSpacing: 0.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    bodyMedium: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 14.dp,
      inherit: false,
      letterSpacing: 0.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    bodySmall: TextStyle(
      color: const Color(0xB3FFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 12.dp,
      inherit: false,
      letterSpacing: 0.4,
      textBaseline: TextBaseline.alphabetic,
    ),
    displayLarge: TextStyle(
      color: const Color(0xB3FFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w300,
      fontSize: 96.dp,
      inherit: false,
      letterSpacing: -1.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    displayMedium: TextStyle(
      color: const Color(0xB3FFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w300,
      fontSize: 60.dp,
      inherit: false,
      letterSpacing: -0.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    displaySmall: TextStyle(
      color: const Color(0xB3FFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 48.dp,
      inherit: false,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),
    headlineLarge: TextStyle(
      color: const Color(0xB3FFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 40.dp,
      inherit: false,
      letterSpacing: 0.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    headlineMedium: TextStyle(
      color: const Color(0xB3FFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 34.dp,
      inherit: false,
      letterSpacing: 0.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    headlineSmall: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 24.dp,
      inherit: false,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),
    labelLarge: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500,
      fontSize: 14.dp,
      inherit: false,
      letterSpacing: 1.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    labelMedium: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 11.dp,
      inherit: false,
      letterSpacing: 1.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    labelSmall: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 10.dp,
      inherit: false,
      letterSpacing: 1.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    titleLarge: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500,
      fontSize: 20.dp,
      inherit: false,
      letterSpacing: 0.15,
      textBaseline: TextBaseline.alphabetic,
    ),
    titleMedium: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 16.dp,
      inherit: false,
      letterSpacing: 0.15,
      textBaseline: TextBaseline.alphabetic,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500,
      fontSize: 14.dp,
      inherit: false,
      letterSpacing: 0.1,
      textBaseline: TextBaseline.alphabetic,
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: const Color(0xDD000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 16.dp,
      inherit: false,
      letterSpacing: 0.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    bodyMedium: TextStyle(
      color: const Color(0xDD000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 14.dp,
      inherit: false,
      letterSpacing: 0.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    bodySmall: TextStyle(
      color: const Color(0x8A000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 12.dp,
      inherit: false,
      letterSpacing: 0.4,
      textBaseline: TextBaseline.alphabetic,
    ),
    displayLarge: TextStyle(
      color: const Color(0x8A000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w300,
      fontSize: 96.dp,
      inherit: false,
      letterSpacing: -1.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    displayMedium: TextStyle(
      color: const Color(0x8A000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w300,
      fontSize: 60.dp,
      inherit: false,
      letterSpacing: -0.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    displaySmall: TextStyle(
      color: const Color(0x8A000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 48.dp,
      inherit: false,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),
    headlineLarge: TextStyle(
      color: const Color(0x8A000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 40.dp,
      inherit: false,
      letterSpacing: 0.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    headlineMedium: TextStyle(
      color: const Color(0x8A000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 34.dp,
      inherit: false,
      letterSpacing: 0.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    headlineSmall: TextStyle(
      color: const Color(0xDD000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 24.dp,
      inherit: false,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),
    labelLarge: TextStyle(
      color: const Color(0xDD000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500,
      fontSize: 14.dp,
      inherit: false,
      letterSpacing: 1.25,
      textBaseline: TextBaseline.alphabetic,
    ),
    labelMedium: TextStyle(
      color: const Color(0xFF000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 11.dp,
      inherit: false,
      letterSpacing: 1.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    labelSmall: TextStyle(
      color: const Color(0xFF000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 10.dp,
      inherit: false,
      letterSpacing: 1.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    titleLarge: TextStyle(
      color: const Color(0xDD000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500,
      fontSize: 20.dp,
      inherit: false,
      letterSpacing: 0.15,
      textBaseline: TextBaseline.alphabetic,
    ),
    titleMedium: TextStyle(
      color: const Color(0xDD000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      fontSize: 16.dp,
      inherit: false,
      letterSpacing: 0.15,
      textBaseline: TextBaseline.alphabetic,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFF000000),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500,
      fontSize: 14.dp,
      inherit: false,
      letterSpacing: 0.1,
      textBaseline: TextBaseline.alphabetic,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    alignLabelWithHint: false,
    filled: false,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    isCollapsed: false,
    isDense: false,
  ),
  buttonTheme: ButtonThemeData(
    height: 36,
    minWidth: 88,
    layoutBehavior: ButtonBarLayoutBehavior.padded,
    textTheme: ButtonTextTheme.normal,
    alignedDropdown: false,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        strokeAlign: -1.0,
        color: Color(0xFF000000),
        style: BorderStyle.none,
        width: 0,
      ),
      borderRadius: BorderRadius.all(Radius.elliptical(2, 2)),
    ),
    colorScheme: _colorScheme,
  ),
);

var _colorScheme = const ColorScheme(
  brightness: Brightness.light,
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1B1B1F),
  primary: Color(0xFF4247E8),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE1E0FF),
  onPrimaryContainer: Color(0xFF0D116D),
  inversePrimary: Color(0xFFBFC1FF),
  secondary: Color(0xFF5C5D72),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE2E0F9),
  onSecondaryContainer: Color(0xFF191A2C),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceTint: Color(0xFF4146e7),
  surfaceVariant: Color(0xFFE4E1EC),
  onSurfaceVariant: Color(0xFF46464F),
  inverseSurface: Color(0xFF313034),
  onInverseSurface: Color(0xFFF3EFF4),
  shadow: Color(0xFF000000),
  outline: Color(0xFF777680),
  outlineVariant: Color(0xFFC7C5D0),
);
