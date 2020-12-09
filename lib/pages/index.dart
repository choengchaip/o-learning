import 'package:flutter/material.dart';
import 'package:o_learning/middlewares/default.dart';

class Index extends StatefulWidget {
  @override
  _Index createState() => _Index();
}

class _Index extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: DefaultMiddleware(
            context: context,
          ),
        ),
      ),
    );
  }
}
