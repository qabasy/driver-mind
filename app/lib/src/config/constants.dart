import 'package:intl/intl.dart';

class Constants {
  Constants._();
  static NumberFormat numberFormat = NumberFormat("#,##", "en_US");
  static NumberFormat currency = NumberFormat.currency(
    locale: "en_US",
    symbol: "\$",
    decimalDigits: 0,
    customPattern: " \u00a4#,###".trim(),
    // customPattern: "#,###",
  );
}


