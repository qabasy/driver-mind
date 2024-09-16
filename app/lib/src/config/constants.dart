import 'package:intl/intl.dart';
import 'package:m_toast/m_toast.dart';

class Constants {
  Constants._();
  static NumberFormat number = NumberFormat.currency(
    symbol: "",
    decimalDigits: 0,
  );
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
