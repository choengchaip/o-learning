import 'package:flutter/material.dart';
import 'package:o_learning/pages/welcome_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';

class DefaultMiddleware extends StatefulWidget {
  final BuildContext context;

  DefaultMiddleware({this.context});

  @override
  _DefaultMiddleware createState() => _DefaultMiddleware(context: this.context);
}

class _DefaultMiddleware extends State<DefaultMiddleware> {
  final BuildContext context;

  _DefaultMiddleware({this.context});

  @override
  void initState() {
    super.initState();
    this.middleware();
  }

  Future<void> middleware() async {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(this.context);
    AuthRepository authRepo = Provider.of<AuthRepository>(this.context);

    await appLocaleRepo.init(context: this.context);
    await appLocaleRepo.loadAsset();
    await appLocaleRepo.locale();

    if (authRepo.isNotAuth) {
      pageLauncher(WelcomePage(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(),
        ),
      ),
    );
  }
}
