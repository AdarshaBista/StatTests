import 'package:flutter/material.dart';

class GapResultCard extends StatelessWidget {
  final String symbol;
  final String list;
  final String listLength;

  GapResultCard({this.symbol, this.list, this.listLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 4.0,
      ),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Symbol: $symbol",
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                list,
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Length: $listLength",
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
