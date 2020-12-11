import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/field.dart';
import 'package:o_learning/utils/validate_helper.dart';

class FieldText extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String placeholder;
  final Function(String) onChanged;
  final String initialValue;

  FieldText(
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
      onChanged: this.onChanged,
      obscureText: false,
    );
  }
}
