import 'dart:math';

class StatInterval {
  final double start;
  final double end;

  StatInterval(this.start, this.end);
}

class Utility {
  // Converts string to list of doubles
  static List<double> converStrToList(String numbersStr,
      [double divFactor = 1.0]) {
    // Remove whitespaces
    numbersStr = numbersStr.trim();
    List<String> numbersStrList = numbersStr.split(RegExp('\\s+'));

    // Convert List of String to List of double
    List<double> numbers = [];
    numbersStrList.forEach((numberStr) {
      double number = (double.tryParse(numberStr) ?? 0.0) / divFactor;
      numbers.add(number);
    });

    return numbers;
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

  // Find smallest number
  static double findSmallest(List<double> list) {
    return list.reduce(min);
  }
}
