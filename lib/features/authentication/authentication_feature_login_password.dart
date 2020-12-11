import 'dart:async';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/field_password.dart';
import 'package:o_learning/components/header_back_button.dart';
import 'package:o_learning/pages/main_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';

class AuthenticationLoginPasswordFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  AuthenticationLoginPasswordFeature({@required this.widgetSliderRepository});

  @override
  _AuthenticationLoginPasswordFeature createState() =>
      _AuthenticationLoginPasswordFeature(
          widgetSliderRepository: this.widgetSliderRepository);
}

class _AuthenticationLoginPasswordFeature
    extends State<AuthenticationLoginPasswordFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final formKey = GlobalKey<FormState>();

  StreamController<bool> passwordValid;
  TextEditingController passwordText = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  _AuthenticationLoginPasswordFeature({@required this.widgetSliderRepository});

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

    return Stack(
      children: [
        Opacity(
          opacity: authRepo.status.isLoading ? 1 : 0,
          child: Container(
            color: Colors.black12,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: authRepo.status.isLoading,
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                HeaderBackButton(
                  backTitle: appLocaleRepo.$l('authentication_login', 'back'),
                  onBack: () {
                    this.widgetSliderRepository.prevWidget();
                  },
                  tailTitle: '2/2',
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
                              margin: EdgeInsets.only(top: 12),
                              title: appLocaleRepo.$l(
                                  'authentication_login', 'continue_button'),
                              onPressed: () async {
                                authRepo.setPassword(this.passwordText.text);
                                this.passwordFocus.unfocus();
                                await authRepo.login(isErrorMock: false);
                                if(authRepo.status.isError){
                                  Flushbar(
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title: 'Login failed',
                                    message: 'please try again later.',
                                    backgroundColor: Theme.of(context).primaryColor,
                                    duration: Duration(seconds: 2),
                                  )..show(context);
                                }

                                pageLauncher(MainPage(), context);
                              },
                            );
                          },
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            appLocaleRepo.$l(
                                'authentication_login', 'forget_password_title'),
                            style: TextStyle(
                                fontSize: fontSizeP, color: gray, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
