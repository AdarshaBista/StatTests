import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/chi_square_test/cs_calculator.dart';
import 'package:stat_tests/chi_square_test/cs_result_column.dart';
import 'package:stat_tests/chi_square_test/cs_result_card.dart';

class CSResultsScreen extends StatelessWidget {
  final CSCalculator calculator;

  CSResultsScreen({this.calculator});

  double _getTableHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double listHeight = calculator.getIntervals().length.toDouble() * 30.0;

    return screenHeight > listHeight ? screenHeight : listHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                CSResultCard(
                  title:
                      "Chi Square = ${Utility.setPrecisionTo4(calculator.calculateChiSquare())}",
                ),
                CSResultCard(
                  title: "Expected = ${calculator.getExpected()}",
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: _getTableHeight(context),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  CSResultColumn(
                    columnId: 1,
                    title: "Intervals",
                    values: calculator.getIntervals(),
                  ),
                  CSResultColumn(
                    columnId: 2,
                    title: "Observed",
                    values: calculator.getIntervals(),
                  ),
                  CSResultColumn(
                    columnId: 3,
                    title: "Calculated",
                    values: calculator.getIthCalcValues(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
