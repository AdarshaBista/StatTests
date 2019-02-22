class GapCalculator {
  final double divFactor;
  final List<double> numbers;
  Set<double> symbols;

  GapCalculator({this.numbers, this.divFactor}) {
    symbols = Set.from(numbers);
  }

  Map calculateGaps() {
    Map gapMap = Map();
    List<int> ithGap = List();

    // Calculate gaps between numbers
    symbols.forEach((symbol) {
      int prevIndex = 0;
      for (int i = 0; i < numbers.length; ++i) {
        if (symbol == numbers[i]) {
          ithGap.add(i - prevIndex - 1);
          prevIndex = i;
        }
      }

      // Remove the initial gap
      if (ithGap.isNotEmpty) ithGap.removeAt(0);

      // Add list to map and clear list
      gapMap[symbol] = List.from(ithGap);
      ithGap.clear();
    });
    return gapMap;
  }
}
