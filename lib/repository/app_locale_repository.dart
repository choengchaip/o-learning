import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:o_learning/states/types.dart';

class AppLocaleRepository extends BaseRepository<dynamic, dynamic> {
  Future<void> loadAsset() async {
    this.toLoadingStatus();

    try {
      dynamic langDataTH = await DefaultAssetBundle.of(this.context)
          .loadString('lib/locales/th.json');
      dynamic langDataEN = await DefaultAssetBundle.of(this.context)
          .loadString('lib/locales/en.json');

      this.object.data['data_th'] = json.decode(langDataTH);
      this.object.data['data_en'] = json.decode(langDataEN);

      this.toSuccessDataStatus();
    } catch (e) {
      this.toErrorStatus();
    }

    this.toCompleteStatus();
  }

  Future<void> locale({String lang}) async {
    this.toLoadingStatus();

    try {
      if (lang == null) {
        lang = Config.defaultLang;
      }

      this.object.data['lang'] = lang;
      this.toSuccessDataStatus();
    } catch (e) {
      this.toErrorStatus();
    }

    this.toCompleteStatus();
  }

  IStatus get status => this.object;
}
