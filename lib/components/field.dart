import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  final FocusNode focusNode;
  final String placeholder;
  final Function(String) onChanged;

  Field(
      {@required this.controller,
      @required this.validator,
      this.focusNode,
      this.placeholder,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: this.onChanged,
      validator: this.validator,
      controller: this.controller,
      focusNode: this.focusNode,
      autofocus: true,
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: gray),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: gray),
        ),
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: gray),
        ),
        contentPadding:
            EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        hintText: this.placeholder,
      ),
      style: TextStyle(fontSize: fontSizeH4),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
