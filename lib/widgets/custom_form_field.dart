import 'package:flutter/material.dart';

class CustomFormField extends TextFormField {
  CustomFormField(
      {BuildContext context,
      TextEditingController controller,
      String hintText,
      FormFieldValidator<String> validator,
      int maxLines: 1})
      : super(
          controller: controller,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.subhead,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            fillColor: Theme.of(context).primaryColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
        );
}
