import 'dart:math';
import 'package:stat_tests/utils/stat_interval.dart';

class Utility {
  static List<double> toDoubleList(String numbersStr,
      [double divFactor = 1.0]) {
    // Convert str to list of substring
    List<String> numbersStrList = convertStrToList(numbersStr);

    // Convert each substring to double
    List<double> numbers = [];
    numbersStrList.forEach((str) {
      double number = (double.tryParse(str) ?? -1.0) / divFactor;
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
      start: setPrecisionTo2(from),
      end: setPrecisionTo2(from + width - offset),
    ));

    // Add the rest
    for (int i = 1; intervals[i - 1].end < to; ++i) {
      double prevIntervalEnd = intervals[i - 1].end;
      intervals.add(StatInterval(
        start: setPrecisionTo2(prevIntervalEnd + offset),
        end: setPrecisionTo2(prevIntervalEnd + width),
      ));
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

  // Find largest number in a list
  static double findLargest(List<double> list) {
    return list.reduce(max);
  }

  // Find smallest number in a list
  static double findSmallest(List<double> list) {
    return list.reduce(min);
  }

  // Find largest number in a list of ints
  static int findLargestInt(List<int> list) {
    return list.reduce(max);
  }

  // Find smallest number in a list of ints
  static int findSmallestInt(List<int> list) {
    return list.reduce(min);
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
