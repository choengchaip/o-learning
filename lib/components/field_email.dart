// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/field.dart';
import 'package:o_learning/utils/validate_helper.dart';

class FieldEmail extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String placeholder;
  final Function(String) onChanged;
  final String initialValue;

  FieldEmail(
      {@required this.controller,
      this.focusNode,
      this.placeholder,
      this.onChanged,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Field(
      initialValue: this.initialValue,
      controller: this.controller,
      textInputType: TextInputType.emailAddress,
      focusNode: this.focusNode,
      placeholder: this.placeholder,
      validator: (String value) {
        if (ValidateHelper.isEmailValid(value)) {
          return null;
        }

        return '';
      },
      onChanged: this.onChanged,
      obscureText: false,
    );
  }
}
