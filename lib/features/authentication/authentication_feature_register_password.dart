import 'dart:async';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/field_password.dart';
import 'package:o_learning/components/header_back_button.dart';
import 'package:o_learning/components/loading.dart';
import 'package:o_learning/pages/index.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';

class AuthenticationRegisterPasswordFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  AuthenticationRegisterPasswordFeature(
      {@required this.widgetSliderRepository});

  @override
  _AuthenticationRegisterPasswordFeature createState() =>
      _AuthenticationRegisterPasswordFeature(
          widgetSliderRepository: this.widgetSliderRepository);
}

class _AuthenticationRegisterPasswordFeature
    extends State<AuthenticationRegisterPasswordFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final formKey = GlobalKey<FormState>();
  StreamController<bool> passwordValid;
  TextEditingController passwordText = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  _AuthenticationRegisterPasswordFeature(
      {@required this.widgetSliderRepository});

  @override
  void initState() {
    this.passwordValid = StreamController<bool>();
    this.passwordValid.add(false);
    this.passwordFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    AuthRepository authRepo = Provider.of<AuthRepository>(context);

    if (authRepo.passwordText.isNotEmpty) {
      this.passwordValid.add(true);
    }

    return Loading(
      isLoading: authRepo.status.isLoading,
      message: appLocaleRepo.$l('status', 'logging_in'),
      component: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            HeaderBackButton(
              backTitle: appLocaleRepo.$l('authentication_register', 'back'),
              onBack: () {
                this.widgetSliderRepository.prevWidget();
              },
              tailTitle: '3/3',
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 48),
                      child: Text(
                        appLocaleRepo.$l(
                            'authentication_login', 'password_title'),
                        style: TextStyle(
                            fontSize: fontSizeH3, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Form(
                        key: formKey,
                        child: FieldPassword(
                          initialValue: authRepo.passwordText,
                          controller: this.passwordText,
                          focusNode: passwordFocus,
                          placeholder: appLocaleRepo.$l(
                              'authentication_login', 'password_placeholder'),
                          onChanged: (String value) {
                            this
                                .passwordValid
                                .add(this.formKey.currentState.validate());
                          },
                        ),
                      ),
                    ),
                    StreamBuilder(
                      stream: passwordValid.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }

                        return CurveButton(
                          isDisabled: !snapshot.data,
                          margin: EdgeInsets.only(top: 12, bottom: 12),
                          title: appLocaleRepo.$l(
                              'authentication_login', 'continue_button'),
                          onPressed: () async {
                            authRepo.setPassword(this.passwordText.text);
                            this.passwordFocus.unfocus();
                            await authRepo.register();
                            if (authRepo.status.isError) {
                              Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                title: 'Login failed',
                                message: 'please try again later.',
                                backgroundColor: Theme.of(context).primaryColor,
                                duration: Duration(seconds: 2),
                              )..show(context);
                            } else {
                              pageLauncher(Index(), context);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
