import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/features/authentication/authentication_feature_background.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class AuthenticationLoginHomeFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  AuthenticationLoginHomeFeature({@required this.widgetSliderRepository});

  @override
  _AuthenticationLoginHomeFeature createState() =>
      _AuthenticationLoginHomeFeature(
          widgetSliderRepository: this.widgetSliderRepository);
}

class _AuthenticationLoginHomeFeature
    extends State<AuthenticationLoginHomeFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  _AuthenticationLoginHomeFeature({@required this.widgetSliderRepository});

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    AuthRepository authRepo = Provider.of<AuthRepository>(context);

    authRepo.reset();

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    this.widgetSliderRepository.nextPage();
                  },
                  child: Container(
                    child: Text(
                      appLocaleRepo.$l('authentication_login', 'sign_up'),
                      style: TextStyle(
                        color: gray,
                        fontSize: fontSizeP,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 32, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('authentication_login', 'title'),
              style: TextStyle(
                  color: dark,
                  fontSize: fontSizeH3,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          AuthenticationBackgroundFeature(),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              appLocaleRepo.$l('authentication_login', 'terms_and_conditions'),
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSizeS1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CurveButton(
            title: appLocaleRepo.$l('authentication_login', 'login_button'),
            onPressed: () {
              this.widgetSliderRepository.nextWidget();
            },
          ),
        ],
      ),
    );
  }
}
