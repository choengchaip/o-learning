// @dart=2.9

import 'dart:async';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/field_password.dart';
import 'package:o_learning/components/header_back_button.dart';
import 'package:o_learning/components/loading.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class ChangePasswordConfirmPasswordFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  ChangePasswordConfirmPasswordFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _ChangePasswordConfirmPasswordFeature createState() =>
      _ChangePasswordConfirmPasswordFeature(
        widgetSliderRepository: this.widgetSliderRepository,
      );
}

class _ChangePasswordConfirmPasswordFeature
    extends State<ChangePasswordConfirmPasswordFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  final formKey = GlobalKey<FormState>();
  StreamController<bool> passwordValid;
  TextEditingController passwordText = TextEditingController(text: '');
  FocusNode passwordFocus;

  _ChangePasswordConfirmPasswordFeature({
    @required this.widgetSliderRepository,
  });

  @override
  void initState() {
    this.passwordValid = StreamController<bool>();
    this.passwordValid.add(false);
    this.passwordFocus = FocusNode();
    this.passwordFocus.requestFocus();
    this.passwordFocus.addListener(() {
      this.passwordText.selection = TextSelection.fromPosition(
          TextPosition(offset: this.passwordText.text.length));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    AuthRepository authRepo = Provider.of<AuthRepository>(context);

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 16,
        right: 16,
      ),
      child: Loading(
        isLoading: authRepo.status.isLoading,
        component: Container(
          child: Column(
            children: [
              HeaderBackButton(
                backTitle: appLocaleRepo.$l('change_password', 'back'),
                onBack: () {
                  this.passwordFocus.unfocus();
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
                              'change_password', 'confirm_password_title'),
                          style: TextStyle(
                              fontSize: fontSizeH3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Form(
                          key: this.formKey,
                          child: FieldPassword(
                            controller: this.passwordText,
                            focusNode: this.passwordFocus,
                            placeholder: appLocaleRepo.$l('change_password',
                                'confirm_password_placeholder'),
                            onChanged: (String value) {
                              if (authRepo.newPasswordText !=
                                  this.passwordText.text) {
                                this.passwordValid.add(false);
                              } else {
                                this
                                    .passwordValid
                                    .add(this.formKey.currentState.validate());
                              }
                            },
                          ),
                        ),
                      ),
                      StreamBuilder(
                        stream: passwordValid.stream,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          }

                          return CurveButton(
                            isDisabled: !snapshot.data,
                            margin: EdgeInsets.only(top: 12, bottom: 12),
                            title: appLocaleRepo.$l(
                                'change_password', 'change_password_button'),
                            onPressed: () async {
                              passwordFocus.unfocus();
                              await authRepo.changePassword();

                              if (authRepo.status.isError) {
                                Flushbar(
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: 'Change password failed',
                                  message: 'please try again later.',
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  duration: Duration(seconds: 2),
                                )..show(context);
                              } else {
                                Navigator.of(context).pop();
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
      ),
    );
  }
}
