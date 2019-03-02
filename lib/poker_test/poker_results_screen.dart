import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/table_column.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/poker_test/poker_calculator.dart';

class PokerResultsScreen extends StatelessWidget {
  final PokerCalculator calculator;
  final int combinations;
  final List<String> _titles = ["All Same", "All Different", "1 Pair"];

  PokerResultsScreen({this.calculator, this.combinations});

  Widget _buildTable() => SizedBox(
        height: 50 + combinations * 30.0,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            TableColumn(
              header: "Combinations",
              values: _titles,
            ),
            TableColumn(
              header: "Observed",
              values: calculator.observedFreqs,
            ),
            TableColumn(
              header: "Expected",
              values: calculator.expectedFreqs,
            ),
            TableColumn(
              header: "(O-E)^2 / E",
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

  Poker3DigitResultsScreen({this.calculator})
      : super(
          calculator: calculator,
          combinations: Poker3DigitCalculator.NUM_OF_COMBINATIONS,
        );
}

class Poker4DigitResultsScreen extends PokerResultsScreen {
  final Poker4DigitCalculator calculator;

  Poker4DigitResultsScreen({this.calculator})
      : super(
          calculator: calculator,
          combinations: Poker4DigitCalculator.NUM_OF_COMBINATIONS,
        ) {
    super._titles.add("2 pair");
    super._titles.add("3 Same");
  }
}
