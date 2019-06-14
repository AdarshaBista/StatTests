class Utility {
  static List<double> toDoubleList(String numbersStr,
      [double divFactor = 1.0]) {
    // Convert str to list of substring
    List<String> numbersStrList = convertStrToList(numbersStr);

    // Convert each substring to double
    List<double> numbers = [];
    numbersStrList.forEach((str) {
      double number = (double.tryParse(str) ?? -1.0) / divFactor;
      numbers.add(setPrecision(number, 6));
    });

    return numbers;
  }

  static List<String> convertStrToList(String numbersStr) {
    numbersStr = numbersStr.trim();
    return numbersStr.split(RegExp('\\s+'));
  }

  // Round off double to given digits
  static double setPrecision(double number, int digits) {
    return double.parse(number.toStringAsPrecision(digits));
  }

  // Round off double to 4 digits
  static double setPrecisionTo4(double number) {
    return setPrecision(number, 4);
  }

  // Check if a string is numeric
  static bool isStrNumeric(String str) {
    return num.tryParse(str) != null;
  }

  // Check if each string in a list of strings is numeric
  static bool isListNumeric(List<String> list) {
    for (String str in list) {
      if (!isStrNumeric(str)) return false;
    }
    return true;
  }
}
