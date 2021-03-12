// @dart=2.9

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/field_text.dart';
import 'package:o_learning/components/header_back_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class AuthenticationRegisterNameFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  AuthenticationRegisterNameFeature({@required this.widgetSliderRepository});

  @override
  _AuthenticationRegisterNameFeature createState() =>
      _AuthenticationRegisterNameFeature(
          widgetSliderRepository: this.widgetSliderRepository);
}

class _AuthenticationRegisterNameFeature
    extends State<AuthenticationRegisterNameFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final formKey = GlobalKey<FormState>();
  StreamController<bool> nameValid;
  TextEditingController nameText = TextEditingController(text: '');
  FocusNode nameFocus;

  _AuthenticationRegisterNameFeature({@required this.widgetSliderRepository});

  @override
  void initState() {
    this.nameValid = StreamController<bool>();
    this.nameValid.add(false);
    this.nameFocus = FocusNode();
    this.nameFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
    Provider.of<AppLocaleRepository>(context);
    AuthRepository authRepo = Provider.of<AuthRepository>(context);

    if(authRepo.nameText.isNotEmpty){
      this.nameValid.add(true);
    }

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          HeaderBackButton(
            backTitle: appLocaleRepo.$l('authentication_login', 'back'),
            onBack: () {
              this.nameFocus.unfocus();
              this.widgetSliderRepository.prevWidget();
            },
            tailTitle: '1/3',
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 48),
                    child: Text(
                      appLocaleRepo.$l('authentication_register', 'name_title'),
                      style: TextStyle(
                          fontSize: fontSizeH3, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Form(
                      key: formKey,
                      child: FieldText(
                        initialValue: authRepo.nameText,
                        controller: this.nameText,
                        focusNode: nameFocus,
                        placeholder: appLocaleRepo.$l(
                            'authentication_register', 'name_placeholder'),
                        onChanged: (String value) {
                          this
                              .nameValid
                              .add(this.formKey.currentState.validate());
                        },
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: nameValid.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      return CurveButton(
                        isDisabled: !snapshot.data,
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        title: appLocaleRepo.$l(
                            'authentication_register', 'continue_button'),
                        onPressed: () {
                          authRepo.setName(this.nameText.text);
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