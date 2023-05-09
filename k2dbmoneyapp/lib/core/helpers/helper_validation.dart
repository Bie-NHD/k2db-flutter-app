import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';

class HelperValidation {
  static const phonePrefix = <int>[
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    52,
    56,
    58,
    59,
    70,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    96,
    97,
    98,
    99
  ];

  static bool isPhoneNum(String num) {
    // eg. +84 912345678
    // +84 or 0 at index [0] -> 9 or 10 length
    // then, check valid comm provider prefix

    if (num.length < 9 || num.length > 10) {
      return false;
    }

    if (num.length == 10) {
      num = num.substring(1);
    }
    String prefix = num.substring(0, 2);
    Iterator iterator = phonePrefix.iterator;

    while (iterator.moveNext()) {
      if (iterator.current.toString() == prefix) {
        return true;
      }
    }

    return false;
  }

  static String? validateAmount(String? value, {double userBalance = 0}) {
    if (value == null || value == "") {
      return "Amount must be filled";
    }
    if (userBalance != 0) {
      if (double.parse(value) < 1000) {
        return "Amount must at least ${1000.0.toFormatMoney()}";
      }
      if (double.parse(value) > userBalance) {
        return "Amount exceeds current balance";
      }
    }

    return null;
  }

  static String? validatePhoneNum(String? value) {
    if (isPhoneNum(value!) == false) {
      return "Wrong phone number format";
    }
    return null;
  }

  static String? validateTextField(String? value,
      {String message = "Field must not be blank"}) {
    if (value == null || value == "") {
      return message;
    }
    return null;
  }
}
