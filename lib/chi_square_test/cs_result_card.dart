import 'package:flutter/material.dart';

class CSResultCard extends StatelessWidget {
  final String title;

  CSResultCard({
    this.title,
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
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }
}
