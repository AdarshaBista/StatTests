import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stat_tests/widgets/table_column.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/gap_test/gap_calculator.dart';
import 'package:stat_tests/gap_test/gap_result_card.dart';

class GapResultsScreen extends StatelessWidget {
  final GapCalculator calculator;

  GapResultsScreen({this.calculator});

  Widget _buildGapsCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: StaggeredGridView.countBuilder(
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemCount: calculator.gapMap.length,
        itemBuilder: (BuildContext context, int index) {
          double key = calculator.gapMap.keys.elementAt(index);
          return GapResultCard(
            symbol: key.toString(),
            list: calculator.gapMap[key].toString(),
            listLength: calculator.gapMap[key].length.toString(),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      ),
    );
  }

  Widget _buildTable() => SizedBox(
        height: 50 + (calculator.intervals.length).toDouble() * 30.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            TableColumn(
              header: "Gap Length",
              values: calculator.intervals,
            ),
            TableColumn(
              header: "Frequency",
              values: calculator.frequencies,
            ),
            TableColumn(
              header: "Relative Freq",
              values: calculator.relativeFreqs,
            ),
            TableColumn(
              header: "Cumulative Freq",
              values: calculator.cumulativeFreqs,
            ),
            TableColumn(
              header: "F(x)",
              values: calculator.fOfX,
            ),
            TableColumn(
              header: "|F(x) - Sn(x)|",
              values: calculator.fOfxMinusSOfX,
            ),
          ],
        ),
      );

  Widget _buildResultsCard() => SingleValueCard(
        value: "D = ${calculator.dCalc}",
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
          _buildGapsCard(context),
          _buildTable(),
          _buildResultsCard(),
        ],
      ),
    );
  }
}
