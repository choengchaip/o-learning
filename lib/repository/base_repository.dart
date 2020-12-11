import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/states/object.dart';
import 'package:o_learning/states/types.dart';

class BaseRepository<T, L> extends ChangeNotifier {
  IStatus<T, L> object = commonObject;
  BuildContext context;
  StreamController<String> lang;

  IStatus get status => this.object;

  initContext({BuildContext context}) {
    this.context = context;
  }

  initLang({StreamController<String> lang}) {
    this.lang = lang;
    this.lang.add(Config.defaultLang);
  }

  toLoadingStatus() {
    this.object.isLoading = true;
    this.object.isLoaded = false;
    this.object.isSuccess = false;
    this.object.isError = false;
    this.notifyListeners();
  }

  toSuccessDataStatus() {
    this.object.isSuccess = true;
    this.notifyListeners();
  }

  toSuccessItemsStatus() {
    this.object.isSuccess = true;
    this.notifyListeners();
  }

  toErrorStatus() {
    this.object.isError = true;
    this.notifyListeners();
  }

  toCompleteStatus() {
    this.object.isLoaded = true;
    this.object.isLoading = false;
    this.notifyListeners();
  }

  void notifyListeners() {
    super.notifyListeners();
  }
}
