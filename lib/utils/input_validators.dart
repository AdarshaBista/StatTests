import 'package:stat_tests/utils/utility.dart';

class InputValidators {
  static String validateNumbersField(String val) {
    if (val.isEmpty) return "Input cannot be empty";
    if (!Utility.isNumeric(Utility.convertStrToList(val)))
      return "Input should contain only numbers";
    return null;
  }
}
