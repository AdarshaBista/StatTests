import 'package:flutter/material.dart';

class CSResultColumn extends StatelessWidget {
  final int columnId;
  final String title;
  final List values;

  CSResultColumn({this.columnId, this.title, this.values});

  String _getTitle(int index) {
    switch (columnId) {
      case 1:
        return "${values[index].start} - ${values[index].end}";
        break;
      case 2:
        return "${values[index].count}";
        break;
      case 3:
        return "${values[index]}";
        break;
    }
    return "";
  }

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
                title,
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
                    _getTitle(index),
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
