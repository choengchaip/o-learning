import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/authentication/authentication_feature_login_email.dart';
import 'package:o_learning/features/authentication/authentication_feature_login_home.dart';
import 'package:o_learning/features/authentication/authentication_feature_login_password.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class AuthenticationLoginFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  AuthenticationLoginFeature({@required this.pageSliderRepository});

  @override
  _AuthenticationLoginFeature createState() => _AuthenticationLoginFeature(
      pageSliderRepository: this.pageSliderRepository);
}

class _AuthenticationLoginFeature extends State<AuthenticationLoginFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _AuthenticationLoginFeature({@required this.pageSliderRepository});

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
                  component: AuthenticationLoginHomeFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: AuthenticationLoginEmailFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: AuthenticationLoginPasswordFeature(
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
