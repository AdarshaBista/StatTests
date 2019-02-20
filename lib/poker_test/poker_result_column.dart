import 'package:flutter/material.dart';

class PokerResultColumn extends StatelessWidget {
  final String header;
  final List values;

  PokerResultColumn({this.header, this.values});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                header,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${values[index]}",
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
