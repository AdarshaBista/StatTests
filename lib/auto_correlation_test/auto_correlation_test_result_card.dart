import 'package:flutter/material.dart';

class AutoCorrelationTestResultCard extends StatelessWidget {
  final String title;

  AutoCorrelationTestResultCard({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
