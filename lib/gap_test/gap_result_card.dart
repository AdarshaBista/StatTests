import 'package:flutter/material.dart';

class GapResultCard extends StatelessWidget {
  final String title;
  final String list;
  final String listSize;

  GapResultCard({
    this.title,
    this.list,
    this.listSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2.0,
        vertical: 4.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
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
                  "Symbol: $title",
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
                  "Length: $listSize",
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
