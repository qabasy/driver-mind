import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m_toast/m_toast.dart';

class Constants {
  Constants._();
  static const Map themeColors = {
    'text': '#180d09',
    'background': '#fcf7f6',
    'primary': '#bd6a46',
    'secondary': '#9adadb',
    'accent': '#787bcf',
  };
  static const textColor = Color(0xFF080506);
  static const backgroundColor = Color(0xFFf8f3f4);
  static const primaryColor = Color(0xFFaf5165);
  static const primaryFgColor = Color(0xFFf8f3f4);
  static const secondaryColor = Color(0xFFdb9ba9);
  static const secondaryFgColor = Color(0xFF080506);
  static const accentColor = Color(0xFFd5647c);
  static const accentFgColor = Color(0xFF080506);

  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    background: backgroundColor,
    onBackground: textColor,
    primary: primaryColor,
    onPrimary: primaryFgColor,
    secondary: secondaryColor,
    onSecondary: secondaryFgColor,
    tertiary: accentColor,
    onTertiary: accentFgColor,
    surface: backgroundColor,
    onSurface: textColor,
    error: Brightness.light == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    onError: Brightness.light == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  );
  static NumberFormat number = NumberFormat.currency(
    symbol: "",
    decimalDigits: 0,
  );
  static String appName = "Driver Mind";
  static NumberFormat currency = NumberFormat.currency(
    locale: "en_US",
    symbol: "\$",
    decimalDigits: 0,
    customPattern: " \u00a4#,###".trim(),
    // customPattern: "#,###",
  );
  static List<TeamMember> members = [
    TeamMember(
      username: "mahros",
      firstName: "Mahros",
      lastName: "AL-Qabasy",
    ),
    TeamMember(
      username: "mahmoud",
      firstName: "Mahmoud",
      lastName: "AL-Akl",
    ),
    TeamMember(
      username: "ahmed",
      firstName: "Ahmed AL-Shoukary",
      lastName: "AL-Akl",
    ),
  ];
  static NumberFormat unit = NumberFormat.compactCurrency(
    name: "TON ",
    locale: "en_US",
    // symbol: " TON",
    // decimalDigits: 1,
    // customPattern: " \u00a4#,###".trim(),

    // locale: "en_US",
    // symbol: "\$",
    // decimalDigits: 0,
    // customPattern: " \u00a4#,###".trim(),
    // customPattern: "#,###",
  );

  // static List<PageViewModel> introductionPages = [];
  // static ShowMToast toast  = ShowMToast(ShowMToast().globalContext);
}

class TeamMember {
  final String username, firstName, lastName, notes;
  TeamMember({
    required this.username,
    required this.firstName,
    required this.lastName,
    this.notes = "Hi! I am flutter developer.",
  });
}
