import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({BuildContext context, String title})
      : super(
          backgroundColor: Colors.white,
          elevation: 6.0,
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        );
}
