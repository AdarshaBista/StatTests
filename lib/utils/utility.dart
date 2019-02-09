class Utility {
  // Converts string to list of doubles
  static List<double> converStrToList(String numbersStr,
      [double divFactor = 1.0]) {
    numbersStr = numbersStr.trim();
    List<String> numbersStrList = numbersStr.split(RegExp('\\s+'));

    List<double> numbers = [];
    numbersStrList.forEach((numberStr) {
      double number = (double.tryParse(numberStr) ?? -1.0) / divFactor;
      numbers.add(number);
    });

    return numbers;
  }
}
