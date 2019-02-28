import 'dart:math';
import 'package:stat_tests/utils/stat_interval.dart';

class Utility {
  // Converts string to list of doubles
  static List<double> toDoubleList(String numbersStr,
      [double divFactor = 1.0]) {
    // Convert str to list of substring
    List<String> numbersStrList = convertStrToList(numbersStr);

    // Convert each substring to double
    List<double> numbers = [];
    numbersStrList.forEach((str) {
      double number = (double.tryParse(str) ?? 0.0) / divFactor;
      numbers.add(number);
    });

    return numbers;
  }

  static List<String> convertStrToList(String numbersStr) {
    numbersStr = numbersStr.trim();
    return numbersStr.split(RegExp('\\s+'));
  }

  // Create intervals with given width
  static List<StatInterval> createIntervals(
      double from, double to, double width, double divFactor) {
    List<StatInterval> intervals = List<StatInterval>();
    double offset = 1.0 / (divFactor * 10.0);

    // Add the first interval
    intervals.add(StatInterval(
        setPrecisionTo2(from), setPrecisionTo2(from + width - offset)));

    // Add the rest
    for (int i = 1; intervals[i - 1].end < to; i++) {
      double prevIntervalEnd = intervals[i - 1].end;
      intervals.add(StatInterval(setPrecisionTo2(prevIntervalEnd + offset),
          setPrecisionTo2(prevIntervalEnd + width)));
    }

    return intervals;
  }

  // Round off double to given digits
  static double setPrecision(double number, int digits) {
    return double.parse(number.toStringAsPrecision(digits));
  }

  // Round off double to 4 digits
  static double setPrecisionTo4(double number) {
    return setPrecision(number, 4);
  }

  // Round off double to 2 digits
  static double setPrecisionTo2(double number) {
    return setPrecision(number, 2);
  }

  // Find largest number
  static double findLargest(List<double> list) {
    return list.reduce(max);
  }

  static int findLargestInt(List<int> list) {
    return list.reduce(max);
  }

  // Find smallest number
  static double findSmallest(List<double> list) {
    return list.reduce(min);
  }

  // Check if each string in a list of string is numeric
  static bool isListNumeric(List<String> list) {
    for (String str in list) {
      if (double.tryParse(str) == null) return false;
    }
    return true;
  }

  // Check if a string is numeric
  static bool isStrNumeric(String str) {
      return num.tryParse(str) != null;
  }
}
