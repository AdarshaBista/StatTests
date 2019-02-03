import 'package:flutter/material.dart';
import '../utils/utility.dart';
import './gap_test_result_card.dart';
import '../widgets/custom_appbar.dart';

class GapTestResults extends StatelessWidget {
  final String numbersStr;
  final String symbolNumStr;

  int symbolNum = 10;
  var gapMap = Map();
  List<double> randomNumbers = List();

  GapTestResults(this.numbersStr, this.symbolNumStr) {
    symbolNum = int.tryParse(symbolNumStr) ?? 10;

    randomNumbers = Utility.converStrToList(numbersStr);
    calculateGaps();
  }

  // Calculate gaps between numbers
  void calculateGaps() {
    List<int> ithGap = List();

    for (int i = 0; i <= symbolNum; ++i) {
      int prevIndex = 0;
      for (int j = 0; j < randomNumbers.length; ++j) {
        if (i == randomNumbers[j]) {
          ithGap.add(j - prevIndex - 1);
          prevIndex = j;
        }
      }

      // Remove the initial gap
      if (ithGap.isNotEmpty) ithGap.removeAt(0);

      // Assign list to map and clear list
      gapMap[i] = List.from(ithGap);
      ithGap.clear();
    }
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
          return GapTestResultsCard(
            title: key.toString(),
            list: gapMap[key].toString(),
            listSize: gapMap[key].length.toString(),
          );
        },
      ),
    );
  }
}
