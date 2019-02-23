class GapCalculator {
  final double divFactor;
  final List<double> numbers;
  List<double> symbols;
  Map gapMap = Map();

  GapCalculator({this.numbers, this.divFactor}) {
    symbols = numbers.toSet().toList();
    symbols.sort();
    populateGapMap();
  }

  void populateGapMap() {
    symbols.forEach((symbol) {
      List<int> ithGap = List();

      // Calculate gaps between numbers
      calculateGaps(symbol, ithGap);

      // Remove the initial gap
      if (ithGap.isNotEmpty) ithGap.removeAt(0);

      // Add list to map
      gapMap[symbol] = List.from(ithGap);
    });
  }

  void calculateGaps(double symbol, List<int> ithGap) {
    int prevIndex = 0;
    for (int i = 0; i < numbers.length; ++i) {
      if (symbol == numbers[i]) {
        ithGap.add(i - prevIndex - 1);
        prevIndex = i;
      }
    }
  }
}
