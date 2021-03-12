// @dart=2.9

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/field_email.dart';
import 'package:o_learning/components/header_back_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class AuthenticationLoginEmailFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  AuthenticationLoginEmailFeature({@required this.widgetSliderRepository});

  @override
  _AuthenticationLoginEmailFeature createState() =>
      _AuthenticationLoginEmailFeature(
          widgetSliderRepository: this.widgetSliderRepository);
}

class _AuthenticationLoginEmailFeature
    extends State<AuthenticationLoginEmailFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final formKey = GlobalKey<FormState>();
  StreamController<bool> emailValid;
  TextEditingController emailText = TextEditingController(text: '');
  FocusNode emailFocus;

  _AuthenticationLoginEmailFeature({@required this.widgetSliderRepository});

  @override
  void initState() {
    this.emailValid = StreamController<bool>();
    this.emailValid.add(false);
    this.emailFocus = FocusNode();
    this.emailFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    AuthRepository authRepo = Provider.of<AuthRepository>(context);

    if(authRepo.emailText.isNotEmpty){
      this.emailValid.add(true);
    }

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          HeaderBackButton(
            backTitle: appLocaleRepo.$l('authentication_login', 'back'),
            onBack: () {
              this.emailFocus.unfocus();
              this.widgetSliderRepository.prevWidget();
            },
            tailTitle: '1/2',
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 48),
                    child: Text(
                      appLocaleRepo.$l('authentication_login', 'email_title'),
                      style: TextStyle(
                          fontSize: fontSizeH3, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Form(
                      key: formKey,
                      child: FieldEmail(
                        initialValue: authRepo.emailText,
                        controller: this.emailText,
                        focusNode: emailFocus,
                        placeholder: appLocaleRepo.$l(
                            'authentication_login', 'email_placeholder'),
                        onChanged: (String value) {
                          this
                              .emailValid
                              .add(this.formKey.currentState.validate());
                        },
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: emailValid.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      return CurveButton(
                        isDisabled: !snapshot.data,
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        title: appLocaleRepo.$l(
                            'authentication_login', 'continue_button'),
                        onPressed: () {
                          authRepo.setEmail(this.emailText.text);
                          this.widgetSliderRepository.nextWidget();
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
    );
  }
}
