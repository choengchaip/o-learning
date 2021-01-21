import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/field_password.dart';
import 'package:o_learning/components/header_back_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class ChangePasswordPasswordFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  ChangePasswordPasswordFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _ChangePasswordPasswordFeature createState() => _ChangePasswordPasswordFeature(
    widgetSliderRepository: this.widgetSliderRepository,
  );
}

class _ChangePasswordPasswordFeature
    extends State<ChangePasswordPasswordFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  final formKey = GlobalKey<FormState>();
  StreamController<bool> passwordValid;
  TextEditingController passwordText = TextEditingController(text: '');
  FocusNode passwordFocus;

  _ChangePasswordPasswordFeature({
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
      child: Column(
        children: [
          HeaderBackButton(
            backTitle: appLocaleRepo.$l('change_password', 'back'),
            onBack: () {
              this.passwordFocus.unfocus();
              Navigator.of(context).pop();
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
                      appLocaleRepo.$l('change_password', 'password_title'),
                      style: TextStyle(
                          fontSize: fontSizeH3, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Form(
                      key: this.formKey,
                      child: FieldPassword(
                        controller: this.passwordText,
                        focusNode: this.passwordFocus,
                        placeholder: appLocaleRepo.$l(
                            'change_password', 'password_placeholder'),
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
                            'change_password', 'continue_button'),
                        onPressed: () {
                          authRepo.setPassword(this.passwordText.text);
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
