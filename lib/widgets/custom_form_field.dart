import 'package:flutter/material.dart';

class CustomFormField extends TextFormField {
  CustomFormField(
      {BuildContext context, TextEditingController controller, String hintText})
      : super(
          controller: controller,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headline,
          decoration: InputDecoration(
            fillColor: Theme.of(context).primaryColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        );
}
