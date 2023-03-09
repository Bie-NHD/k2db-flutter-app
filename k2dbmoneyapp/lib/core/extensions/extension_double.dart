import 'package:intl/intl.dart';

final formatCurrency =
    NumberFormat.simpleCurrency(locale: "vi-VN", decimalDigits: 0);

extension StringX on double {
  String toFormatMoney() {
    return formatCurrency.format(this);
  }
}
