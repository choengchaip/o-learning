import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:o_learning/states/types.dart';

class AppLocaleRepository extends BaseRepository<dynamic, dynamic> {
  String get locale => this.object.data['lang'];

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

  Future<void> switchLocale({String lang}) async {
    this.toLoadingStatus();

    try {
      if (lang == null) {
        lang = Config.defaultLang;
      }

      this.object.data['lang'] = lang;
      this.lang.add(lang);

      this.toSuccessDataStatus();
    } catch (e) {
      this.toErrorStatus();
    }

    this.toCompleteStatus();
  }

  IStatus get status => this.object;

  String $l(String base, String path) {
    String word =
        this.object.data['data_${this.object.data['lang']}'][base][path];

    if (word == null) {
      word = this.object.data['data_th'][base][path];
    }

    return word;
  }
}
