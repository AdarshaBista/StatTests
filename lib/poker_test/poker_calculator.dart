import 'package:stat_tests/utils/utility.dart';

class PokerCalculator {
  List<double> _probabilities = [];
  List<int> _observedFreqs = [];
  List<double> _expectedFreqs = [];
  List<double> _ithCalcValues = [];
  double _chiSquareCalc;

  List<double> get probabilities => _probabilities;
  List<int> get observedFreqs => _observedFreqs;
  List<double> get expectedFreqs => _expectedFreqs;
  List<double> get ithCalcValues => _ithCalcValues;
  double get chiSquareCalc => _chiSquareCalc;

  void _calculateExpectedFreq(int combinations, List<double> probabilities) {
    final int total = _observedFreqs.reduce((a, b) => a + b);
    for (int i = 0; i < combinations; ++i) {
      double expectedFreq = total * probabilities[i];
      _expectedFreqs.add(Utility.setPrecisionTo4(expectedFreq));
    }
  }

  void _calculateithCalcValues(int combinations) {
    for (int i = 0; i < combinations; ++i) {
      double diff = _observedFreqs[i] - _expectedFreqs[i];
      double diffSquared = diff * diff;
      double ithValue = diffSquared / _expectedFreqs[i];
      _ithCalcValues.add(Utility.setPrecisionTo4(ithValue));
    }
  }

  void _calculateChiSquare() {
    double value = _ithCalcValues.reduce((a, b) => a + b);
    _chiSquareCalc = Utility.setPrecisionTo4(value);
  }
}

class Poker3DigitCalculator extends PokerCalculator {
  static const int NUM_OF_COMBINATIONS = 3;

  Poker3DigitCalculator(List<int> inputs) {
    _probabilities = [0.01, 0.72, 0.27];
    _observedFreqs = inputs;

    super._calculateExpectedFreq(NUM_OF_COMBINATIONS, _probabilities);
    super._calculateithCalcValues(NUM_OF_COMBINATIONS);
    super._calculateChiSquare();
  }
}

class Poker4DigitCalculator extends PokerCalculator {
  static const int NUM_OF_COMBINATIONS = 5;

  Poker4DigitCalculator(List<int> inputs) {
    _probabilities = [0.001, 0.504, 0.431, 0.027, 0.0376];
    _observedFreqs = inputs;

    super._calculateExpectedFreq(NUM_OF_COMBINATIONS, _probabilities);
    super._calculateithCalcValues(NUM_OF_COMBINATIONS);
    super._calculateChiSquare();
  }
}
