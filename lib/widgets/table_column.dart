import 'package:flutter/material.dart';

class TableColumn extends StatelessWidget {
  final String header;
  final List values;

  TableColumn({this.header, this.values});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
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
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: values
                .map(
                  (value) => Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            value.toString(),
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
