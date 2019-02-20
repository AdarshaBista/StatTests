import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/chi_square_test/cs_result_card.dart';
import 'package:stat_tests/poker_test/poker_calculator.dart';
import 'package:stat_tests/poker_test/poker_result_column.dart';

class Poker3DigitResultsScreen extends StatelessWidget {
  final Poker3DigitCalculator calculator;
  final List<String> titles = ["All Same", "All Different", "1 Pair"];

  Poker3DigitResultsScreen({this.calculator});

  Widget _buildTable() => SizedBox(
        height: 5 * 30.0,
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
          CSResultCard(
            title: "Chi Square = ${calculator.chiSquareCalc}",
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

class Poker4DigitResultsScreen extends StatelessWidget {
  final Poker4DigitCalculator calculator;
  final List<String> titles = [
    "All Same",
    "All Different",
    "1 Pair",
    "2 Pair",
    "3 Same"
  ];

  Poker4DigitResultsScreen({this.calculator});

  Widget _buildTable() => SizedBox(
        height: 7 * 30.0,
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
          CSResultCard(
            title: "Chi Square = ${calculator.chiSquareCalc}",
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
