import 'package:flutter/material.dart';

class SingleValueCard extends StatelessWidget {
  final String value;

  SingleValueCard({
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      child: Card(
        color: Colors.white,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Center(
          child: Text(
            value,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
