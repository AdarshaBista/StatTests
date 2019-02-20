import 'package:stat_tests/utils/utility.dart';

class PokerCalculator {
  static List<double> calculateExpectedFreq(
      int total, int digits, List<double> probabilities) {
    List<double> expectedFreqs = [];
    for (int i = 0; i < digits; ++i) {
      double expectedFreq = total * probabilities[i];
      expectedFreqs.add(expectedFreq);
    }
    return expectedFreqs;
  }

  static List<double> calculateithCalcValues(
      int digits, List<int> observedFreqs, List<double> expectedFreqs) {
    List<double> ithCalcValues = [];
    for (int i = 0; i < digits; ++i) {
      double diff = observedFreqs[i] - expectedFreqs[i];
      double diffSquared = diff * diff;
      double ithValue = Utility.setPrecisionTo4(diffSquared / expectedFreqs[i]);
      ithCalcValues.add(ithValue);
    }
    return ithCalcValues;
  }

  static double calculateChiSquare(List<double> ithCalcValues) {
    double chiSquareCalc = ithCalcValues.reduce((a, b) => a + b);
    return Utility.setPrecisionTo4(chiSquareCalc);
  }
}

class Poker3DigitCalculator {
  final List<double> probabilities = [0.01, 0.72, 0.27];
  int total;
  double chiSquareCalc;

  List<int> observedFreqs = [];
  List<double> expectedFreqs = [];
  List<double> ithCalcValues = [];

  Poker3DigitCalculator({int allSame, int allDiff, int onePair}) {
    observedFreqs = [allSame, allDiff, onePair];
    total = allSame + allDiff + onePair;

    expectedFreqs =
        PokerCalculator.calculateExpectedFreq(total, 3, probabilities);
    ithCalcValues =
        PokerCalculator.calculateithCalcValues(3, observedFreqs, expectedFreqs);
    chiSquareCalc = PokerCalculator.calculateChiSquare(ithCalcValues);
  }
}

class Poker4DigitCalculator {
  final List<double> probabilities = [0.001, 0.504, 0.431, 0.027, 0.0376];
  int total;
  double chiSquareCalc;

  List<int> observedFreqs = [];
  List<double> expectedFreqs = [];
  List<double> ithCalcValues = [];

  Poker4DigitCalculator(
      {int allSame, int allDiff, int onePair, int twoPair, int threeSame}) {
    observedFreqs = [allSame, allDiff, onePair, twoPair, threeSame];
    total = allSame + allDiff + onePair + twoPair + threeSame;

    expectedFreqs =
        PokerCalculator.calculateExpectedFreq(total, 5, probabilities);
    ithCalcValues =
        PokerCalculator.calculateithCalcValues(5, observedFreqs, expectedFreqs);
    chiSquareCalc = PokerCalculator.calculateChiSquare(ithCalcValues);
  }
}
