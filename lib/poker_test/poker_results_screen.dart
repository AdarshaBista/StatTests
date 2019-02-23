import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/poker_test/poker_calculator.dart';
import 'package:stat_tests/poker_test/poker_result_column.dart';

class PokerResultsScreen extends StatelessWidget {
  final PokerCalculator calculator;
  final int combinations;
  final List<String> titles = ["All Same", "All Different", "1 Pair"];

  PokerResultsScreen({this.calculator, this.combinations});

  Widget _buildTable() => SizedBox(
        height: (combinations + 2) * 30.0,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            PokerResultColumn(
              header: "Combinations",
              values: titles,
            ),
            PokerResultColumn(
              header: "Observed",
              values: calculator.observedFreqs,
            ),
            PokerResultColumn(
              header: "Expected",
              values: calculator.expectedFreqs,
            ),
            PokerResultColumn(
              header: "(O - E)**2 / E",
              values: calculator.ithCalcValues,
            ),
          ],
        ),
      );

  Widget _buildResultsCards() => Column(
        children: <Widget>[
          SingleValueCard(
            value: "Chi Square = ${calculator.chiSquareCalc}",
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildTable(),
          _buildResultsCards(),
        ],
      ),
    );
  }
}

class Poker3DigitResultsScreen extends PokerResultsScreen {
  final Poker3DigitCalculator calculator;
  static const int COMBINATIONS = 3;

  Poker3DigitResultsScreen({this.calculator})
      : super(calculator: calculator, combinations: COMBINATIONS);
}

class Poker4DigitResultsScreen extends PokerResultsScreen {
  final Poker4DigitCalculator calculator;
  static const int COMBINATIONS = 5;

  Poker4DigitResultsScreen({this.calculator})
      : super(calculator: calculator, combinations: COMBINATIONS) {
    super.titles.add("2 pair");
    super.titles.add("3 Same");
  }
}
