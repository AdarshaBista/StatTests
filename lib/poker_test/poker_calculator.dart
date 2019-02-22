import 'package:stat_tests/utils/utility.dart';

class PokerCalculator {
  int total;
  double chiSquareCalc;

  List<int> observedFreqs = [];
  List<double> expectedFreqs = [];
  List<double> ithCalcValues = [];

  void calculateExpectedFreq(
      int total, int combinations, List<double> probabilities) {
    for (int i = 0; i < combinations; ++i) {
      double expectedFreq = total * probabilities[i];
      expectedFreqs.add(Utility.setPrecisionTo4(expectedFreq));
    }
  }

  void calculateithCalcValues(int combinations) {
    for (int i = 0; i < combinations; ++i) {
      double diff = observedFreqs[i] - expectedFreqs[i];
      double diffSquared = diff * diff;
      double ithValue = diffSquared / expectedFreqs[i];
      ithCalcValues.add(Utility.setPrecisionTo4(ithValue));
    }
  }

  void calculateChiSquare() {
    double value = ithCalcValues.reduce((a, b) => a + b);
    chiSquareCalc = Utility.setPrecisionTo4(value);
  }
}

class Poker3DigitCalculator extends PokerCalculator {
  final List<double> probabilities = [0.01, 0.72, 0.27];
  static const int COMBINATIONS = 3;

  Poker3DigitCalculator({int allSame, int allDiff, int onePair}) {
    observedFreqs = [allSame, allDiff, onePair];
    total = observedFreqs.reduce((a, b) => a + b);

    super.calculateExpectedFreq(total, COMBINATIONS, probabilities);
    super.calculateithCalcValues(COMBINATIONS);
    super.calculateChiSquare();
  }
}

class Poker4DigitCalculator extends PokerCalculator {
  final List<double> probabilities = [0.001, 0.504, 0.431, 0.027, 0.0376];
  static const int COMBINATIONS = 5;

  Poker4DigitCalculator(
      {int allSame, int allDiff, int onePair, int twoPair, int threeSame}) {
    observedFreqs = [allSame, allDiff, onePair, twoPair, threeSame];
    total = observedFreqs.reduce((a, b) => a + b);

    super.calculateExpectedFreq(total, COMBINATIONS, probabilities);
    super.calculateithCalcValues(COMBINATIONS);
    super.calculateChiSquare();
  }
}
