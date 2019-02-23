import 'package:flutter/material.dart';

class CustomButton extends RaisedButton {
  CustomButton({BuildContext context, String text, Function onPressed})
      : super(
          padding: const EdgeInsets.all(12.0),
          color: Theme.of(context).primaryColor,
          elevation: 6.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          onPressed: onPressed,
        );
}
