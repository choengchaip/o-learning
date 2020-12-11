import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/authentication/authentication_feature_login_email.dart';
import 'package:o_learning/features/authentication/authentication_feature_login_home.dart';
import 'package:o_learning/features/authentication/authentication_feature_login_password.dart';
import 'package:o_learning/features/authentication/authentication_feature_register_email.dart';
import 'package:o_learning/features/authentication/authentication_feature_register_home.dart';
import 'package:o_learning/features/authentication/authentication_feature_register_name.dart';
import 'package:o_learning/features/authentication/authentication_feature_register_password.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class AuthenticationRegisterFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  AuthenticationRegisterFeature({@required this.pageSliderRepository});

  @override
  _AuthenticationRegisterFeature createState() => _AuthenticationRegisterFeature(
      pageSliderRepository: this.pageSliderRepository);
}

class _AuthenticationRegisterFeature extends State<AuthenticationRegisterFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _AuthenticationRegisterFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this
        .widgetSliderRepository
        .initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: WidgetSlider(
              widgetSliderRepository: this.widgetSliderRepository,
              scrollable: false,
              showDot: false,
              components: [
                IWidgetSlider(
                  component: AuthenticationRegisterHomeFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: AuthenticationRegisterNameFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: AuthenticationRegisterEmailFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: AuthenticationRegisterPasswordFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
