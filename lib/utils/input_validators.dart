import 'package:stat_tests/utils/utility.dart';

class InputValidators {
  static String validateNumbersField(String val) {
    if (val.isEmpty) return "Field Cannot Be Empty";
    if (!Utility.isNumeric(val)) return "Input should contain only numbers";
    return null;
  }
}
