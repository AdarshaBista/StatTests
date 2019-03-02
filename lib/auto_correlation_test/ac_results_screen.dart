import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/auto_correlation_test/ac_calculator.dart';

class ACResultsScreen extends StatelessWidget {
  final ACCalculator calculator;

  ACResultsScreen({this.calculator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          SingleValueCard(
            value: "M = ${calculator.capitalM}",
          ),
          SingleValueCard(
            value: "Sum = ${calculator.sum}",
          ),
          SingleValueCard(
            value: "Rho = ${calculator.rho}",
          ),
          SingleValueCard(
            value: "Sigma Rho = ${calculator.sigmaRho}",
          ),
          SingleValueCard(
            value: "Zo = ${calculator.zCalc}",
          ),
        ],
      ),
    );
  }
}
