import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  final String title;
  final String bgPath;
  final Function onPressed;

  TestCard({
    this.title,
    this.bgPath,
    this.onPressed,
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
        child: InkWell(
          splashColor: Theme.of(context).accentColor,
          onTap: onPressed,
          child: Stack(
            alignment: FractionalOffset.center,
            children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //     image: AssetImage(bgPath),
              //     fit: BoxFit.cover,
              //   )),
              // ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
