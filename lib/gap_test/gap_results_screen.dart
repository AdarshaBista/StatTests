import 'package:flutter/material.dart';
import 'package:stat_tests/gap_test/gap_calculator.dart';
import '../utils/utility.dart';
import './gap_result_card.dart';
import '../widgets/custom_appbar.dart';

class GapResultsScreen extends StatelessWidget {
  final GapCalculator calculator;
  Map<int, List<double>> gapMap;

  GapResultsScreen({this.calculator}) {
    gapMap = calculator.calculateGaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: gapMap.length,
        itemBuilder: (BuildContext context, int index) {
          int key = gapMap.keys.elementAt(index);
          return GapResultCard(
            title: key.toString(),
            list: gapMap[key].toString(),
            listSize: gapMap[key].length.toString(),
          );
        },
      ),
    );
  }
}
