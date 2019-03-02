import 'package:flutter/material.dart';

class CustomButton extends RaisedButton {
  CustomButton({BuildContext context, String label, Function onPressed})
      : super(
          padding: const EdgeInsets.all(12.0),
          color: Theme.of(context).primaryColor,
          elevation: 6.0,
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          onPressed: onPressed,
        );
}
