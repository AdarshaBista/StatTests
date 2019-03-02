import 'package:flutter/foundation.dart';

class StatInterval {
  final double start;
  final double end;

  StatInterval({
    @required this.start,
    @required this.end,
  });

  String toString() {
    return "$start - $end";
  }
}
