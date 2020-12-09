import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T> pageLauncher<T>(StatefulWidget vm, context,
    {bool isNewTask = false}) async {
  if (vm is StatelessWidget || vm is StatefulWidget) {
    if (isNewTask) {
      return await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => vm),
          (route) => route == null);
    } else {
      return await Navigator.of(context)
          .push(MaterialPageRoute<T>(builder: (_) => vm));
    }
  } else {
    throw Exception('Widget should be StatelessWidget or StatefulWidget');
  }
}
