import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get getDate {
    DateFormat transactionDateFormat = DateFormat('dd MMM yyyy');
    return transactionDateFormat.format(this);
  }
}
