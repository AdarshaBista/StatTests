import 'package:flutter/material.dart';

class TableColumn extends StatelessWidget {
  final String header;
  final List values;

  TableColumn({this.header, this.values});

  Widget _buildHeader(BuildContext context) => Container(
        height: 40.0,
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            header,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.headline.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      );

  Widget _buildColumn(BuildContext context) => ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: values
            .map(
              (value) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        value.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                  ),
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: <Widget>[
          _buildHeader(context),
          _buildColumn(context),
        ],
      ),
    );
  }
}
