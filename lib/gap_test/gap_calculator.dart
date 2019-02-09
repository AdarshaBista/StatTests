class GapCalculator {
  final int symbolNum;
  final double divFactor;
  final List<double> numbers;

  GapCalculator({this.numbers, this.divFactor, this.symbolNum});

  Map<int, List<double>> calculateGaps() {
    var gapMap = Map();
    List<int> ithGap = List();

    // Calculate gaps between numbers
    for (int i = 0; i <= symbolNum; ++i) {
      int prevIndex = 0;
      for (int j = 0; j < numbers.length; ++j) {
        if (i == numbers[j]) {
          ithGap.add(j - prevIndex - 1);
          prevIndex = j;
        }
      }

      // Remove the initial gap
      if (ithGap.isNotEmpty) ithGap.removeAt(0);

      // Add list to map and clear list
      gapMap[i] = List.from(ithGap);
      ithGap.clear();
    }
    return gapMap;
  }
}
