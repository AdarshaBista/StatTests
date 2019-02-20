class Poker3DigitCalculator {
  final int allSame;
  final int allDiff;
  final int onePair;

  Poker3DigitCalculator({this.allSame, this.allDiff, this.onePair});
}

class Poker4DigitCalculator {
  final int allSame;
  final int allDiff;
  final int onePair;
  final int twoPair;
  final int threeSame;

  Poker4DigitCalculator(
      {this.allSame, this.allDiff, this.onePair, this.twoPair, this.threeSame});
}
