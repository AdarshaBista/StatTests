import 'package:stat_tests/utils/utility.dart';

class InputValidators {
  static final String emptyError = "Cannot be empty";
  static final String notNumericError = "Should contain a number";
  static final String negativeError = "Should be zero or positive";
  static final String zeroError = "Should be non-zero";
  static final String nonPositiveError = "Should be positive and non-zero";
  static final String intError = "Should be an integer";

  static String validateNumbersField(String val) {
    if (val.isEmpty) return emptyError;
    if (!Utility.isListNumeric(Utility.convertStrToList(val)))
      return "Should contain only numbers";
    return null;
  }

  static String validateNonZeroField(String val) {
    if (val.isEmpty) return emptyError;
    if (!Utility.isStrNumeric(val)) return notNumericError;
    if (num.tryParse(val) == 0) return zeroError;
    return null;
  }

  static String validateNonZeroPositiveField(String val) {
    if (val.isEmpty) return emptyError;
    if (!Utility.isStrNumeric(val)) return notNumericError;
    if (num.tryParse(val) <= 0) return nonPositiveError;
    return null;
  }

  static String validateNonZeroPositiveIntField(String val) {
    if (val.isEmpty) return emptyError;
    if (!Utility.isStrNumeric(val)) return notNumericError;
    if (num.tryParse(val) <= 0) return nonPositiveError;
    if (!(num.tryParse(val) is int)) return intError;
    return null;
  }

  static String validatePositiveField(String val) {
    if (val.isEmpty) return emptyError;
    if (!Utility.isStrNumeric(val)) return notNumericError;
    if (num.tryParse(val) < 0) return negativeError;
    if (!(num.tryParse(val) is int)) return intError;
    return null;
  }
}
