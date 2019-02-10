import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/auto_correlation_test/ac_calculator.dart';
import 'package:stat_tests/auto_correlation_test/ac_result_card.dart';

class ACResultsScreen extends StatelessWidget {
  final ACCalculator calculator;
  int capitalM;
  double sigmaRhoIm;
  double rhoIm;
  double zCalc;

  ACResultsScreen({this.calculator}) {
    capitalM = calculator.calculateCapitalM();
    sigmaRhoIm = calculator.calculateSigmaRhoIm(capitalM);
    rhoIm = calculator.calculateRhoIm(capitalM);
    zCalc = calculator.calculateZcalc(rhoIm, sigmaRhoIm);
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
          ACResultCard(
            title: "M = $capitalM",
          ),
          ACResultCard(
            title: "Rho = $rhoIm",
          ),
          ACResultCard(
            title: "Sigma Rho = $sigmaRhoIm",
          ),
          ACResultCard(
            title: "Zo = $zCalc",
          ),
        ],
      ),
    );
  }
}
