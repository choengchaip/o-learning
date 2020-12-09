import 'package:flutter/material.dart';
import 'package:o_learning/assets/theme.dart';
import 'package:o_learning/pages/index.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLocaleRepository()),
        ChangeNotifierProvider(create: (_) => AuthRepository()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'O-Learning',
          theme: AppThemeData.lightTheme,
          home: Index()),
    );
  }
}
