import 'package:flutter/foundation.dart';

class StatInterval<T> {
  final T start;
  final T end;

  StatInterval({
    @required this.start,
    @required this.end,
  });

  String toString() {
    return "$start - $end";
  }
}
