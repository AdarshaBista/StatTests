import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/auto_correlation_test/ac_calculator.dart';

class ACResultsScreen extends StatelessWidget {
  final ACCalculator calculator;
  int capitalM;
  double sigmaRhoIm;
  double rhoIm;
  double zCalc;

  ACResultsScreen({this.calculator}) {
    capitalM = calculator.calculateCapitalM();
    sigmaRhoIm =
        Utility.setPrecisionTo4(calculator.calculateSigmaRhoIm(capitalM));
    rhoIm = Utility.setPrecisionTo4(calculator.calculateRhoIm(capitalM));
    zCalc =
        Utility.setPrecisionTo4(calculator.calculateZcalc(rhoIm, sigmaRhoIm));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        itemExtent: 90.0,
        shrinkWrap: true,
        children: <Widget>[
          SingleValueCard(
            value: "M = $capitalM",
          ),
          SingleValueCard(
            value: "Rho = $rhoIm",
          ),
          SingleValueCard(
            value: "Sigma Rho = $sigmaRhoIm",
          ),
          SingleValueCard(
            value: "Zo = $zCalc",
          ),
        ],
      ),
    );
  }
}
