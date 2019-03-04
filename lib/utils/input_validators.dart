import 'package:stat_tests/utils/utility.dart';

class InputValidators {
  static const String FIELD_EMPTY_ERROR = "Should not be empty";
  static const String NON_NUMERIC_LIST_ERROR = "Should contain only numbers";
  static const String NON_NUMERIC_VALUE_ERROR = "Should contain a number";
  static const String NEGATIVE_VALUE_ERROR = "Should be zero or positive";
  static const String ZERO_VALUE_ERROR = "Should be non-zero";
  static const String NON_INTEGER_ERROR = "Should be an integer";
  static const String RANGE_ERROR = "Should be smaller";
  static const String NON_POSITIVE_VALUE_ERROR =
      "Should be positive and non-zero";

  static String validateNumbersField(String val) {
    if (val.isEmpty) return FIELD_EMPTY_ERROR;
    if (!Utility.isListNumeric(Utility.convertStrToList(val)))
      return NON_NUMERIC_LIST_ERROR;
    return null;
  }

  static String validatePositiveField(String val) {
    if (val.isEmpty) return FIELD_EMPTY_ERROR;
    if (!Utility.isStrNumeric(val)) return NON_NUMERIC_VALUE_ERROR;
    if (num.tryParse(val) < 0) return NEGATIVE_VALUE_ERROR;
    if (!(num.tryParse(val) is int)) return NON_INTEGER_ERROR;
    return null;
  }

  static String validateNonZeroField(String val) {
    if (val.isEmpty) return FIELD_EMPTY_ERROR;
    if (!Utility.isStrNumeric(val)) return NON_NUMERIC_VALUE_ERROR;
    if (num.tryParse(val) == 0) return ZERO_VALUE_ERROR;
    return null;
  }

  static String validateNonZeroPositiveField(String val) {
    if (val.isEmpty) return FIELD_EMPTY_ERROR;
    if (!Utility.isStrNumeric(val)) return NON_NUMERIC_VALUE_ERROR;
    if (num.tryParse(val) <= 0) return NON_POSITIVE_VALUE_ERROR;
    return null;
  }

  static String validateNonZeroPositiveIntField(String val,
      [int limit = 99999999]) {
    if (val.isEmpty) return FIELD_EMPTY_ERROR;
    if (!Utility.isStrNumeric(val)) return NON_NUMERIC_VALUE_ERROR;
    if (num.tryParse(val) <= 0) return NON_POSITIVE_VALUE_ERROR;
    if (!(num.tryParse(val) is int)) return NON_INTEGER_ERROR;
    if (num.parse(val) > limit) return RANGE_ERROR;
    return null;
  }
}
