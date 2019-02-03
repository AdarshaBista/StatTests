class Utility {
  static List<double> converStrToList(String numbersStr,
      [double divFactor = 1.0]) {
    List<String> numbersStrList = numbersStr.split(" ");
    List<double> numbers = [];

    for (int i = 0; i < numbersStrList.length; ++i) {
      double value = (double.tryParse(numbersStrList[i]) ?? -1.0) / divFactor;
      numbers.add(value);
    }
    return numbers;
  }
}
