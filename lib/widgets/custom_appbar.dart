import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({BuildContext context, String title})
      : super(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context).textTheme.title.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        );
}
