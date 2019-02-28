class StatInterval {
  final double start;
  final double end;

  StatInterval(this.start, this.end);

  void printInterval() {
    print("$start - $end");
  }
}