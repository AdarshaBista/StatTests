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

  int get capitalM => _capitalM;
  double get sigmaRho => _sigmaRho;
  double get rho => _rho;
  double get sum => _sum;
  double get zCalc => _zCalc;

  ACCalculator({this.numbers, this.divFactor, this.ithNumber, this.lag}) {
    _calculateCapitalM();
    _calculateSigmaRho();
    _calculateRho();
    _calculateZCalc();
  }

  void _calculateCapitalM() {
    _capitalM = (numbers.length - lag - ithNumber) ~/ lag;
    print(numbers.length);
    print(lag);
    print(ithNumber);
    print(_capitalM);
  }

  void _calculateSigmaRho() {
    double numerator = sqrt(13 * _capitalM + 7);
    double denominator = 12 * (_capitalM + 1.0);
    _sigmaRho = Utility.setPrecisionTo4(numerator / denominator);
  }

  void _calculateRho() {
    double oneOverMPlusOne = 1.0 / (_capitalM + 1.0);

    double sum = 0.0;
    int i = ithNumber - 1;
    for (int k = 0; k <= _capitalM; ++k) {
      double firstNum = numbers[i + k * lag];
      double secondNum = numbers[i + (k + 1) * lag];
      sum += firstNum * secondNum;
    }
    _sum = Utility.setPrecisionTo4(sum);
    _rho = Utility.setPrecisionTo4(oneOverMPlusOne * _sum - 0.25);
  }

  void _calculateZCalc() {
    _zCalc = Utility.setPrecisionTo4(_rho / _sigmaRho);
  }
}
