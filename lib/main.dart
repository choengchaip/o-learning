// @dart=2.9

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/theme.dart';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/pages/index.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/subject_widget_repository.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  StreamController lang;
  AppLocaleRepository appLocaleRepository = new AppLocaleRepository();

  @override
  void initState() {
    this.lang = StreamController<String>();
    this.appLocaleRepository.initLang(lang: lang);
    this.appLocaleRepository.switchLocale(lang: Config.defaultLang);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => appLocaleRepository),
        ChangeNotifierProvider(create: (_) => AuthRepository()),
        ChangeNotifierProvider(create: (_) => SubjectRepository()),
        ChangeNotifierProvider(create: (_) => QuizRepository()),
      ],
      child: StreamBuilder(
        stream: lang.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'O-Learning',
              theme: AppThemeData.lightTheme(lang: snapshot.data),
              home: !snapshot.hasData ? Container() : Index());
        },
      ),
    );
  }
}
