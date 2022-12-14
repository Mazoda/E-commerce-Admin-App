import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController controller;
  TextInputType? textInputType;
  Widget? suffix;
  final Function validator;
  CustomTextfield(
      {required this.validator,
      required this.controller,
      this.suffix,
      this.textInputType});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: (x) => validator(x),
      decoration: InputDecoration(
          suffixIcon: suffix,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
