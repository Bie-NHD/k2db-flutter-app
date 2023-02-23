import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency(locale: "vi-VN");

extension StringX on double {
  String toFormatMoney() {
    return formatCurrency.format(this);
  }
}
