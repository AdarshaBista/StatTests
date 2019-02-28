import 'package:flutter/material.dart';

class SlideUpTransition extends PageRouteBuilder {
  final Widget widget;
  SlideUpTransition({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              widget,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, -1.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
        );
}
