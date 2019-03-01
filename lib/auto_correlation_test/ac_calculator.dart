import 'dart:math';
import 'package:stat_tests/utils/utility.dart';

class ACCalculator {
  final double divFactor;
  final List<double> numbers;
  final int ithNumber;
  final int lag;

  int _capitalM;
  double _sigmaRho;
  double _rho;
  double _sum;
  double _zCalc;

  ACCalculator({this.numbers, this.divFactor, this.ithNumber, this.lag});

  int get capitalM => _capitalM;
  double get sigmaRho => _sigmaRho;
  double get rho => _rho;
  double get sum => _sum;
  double get zCalc => _zCalc;

  void calculateCapitalM() {
    _capitalM = (numbers.length - lag - ithNumber) ~/ lag;
  }

  void calculateSigmaRhoIm() {
    double numerator = sqrt(13 * _capitalM + 7);
    double denominator = 12 * (_capitalM + 1.0);
    _sigmaRho = Utility.setPrecisionTo4(numerator / denominator);
  }

  void calculateRhoIm() {
    double oneOverMPlusOne = 1.0 / (_capitalM + 1.0);

    _sum = 0.0;
    for (int k = 0; k <= _capitalM; ++k) {
      double firstNum = numbers[ithNumber + k * lag];
      double secondNum = numbers[ithNumber + (k + 1) * lag];

      _sum += Utility.setPrecisionTo4(firstNum * secondNum);
    }
    _rho = Utility.setPrecisionTo4(oneOverMPlusOne * _sum - 0.25);
  }

  void calculateZcalc() {
    _zCalc = Utility.setPrecisionTo4(_rho / _sigmaRho);
  }
}
