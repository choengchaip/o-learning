import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/authentication/authentication_feature_login.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class AuthenticationRegisterFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  AuthenticationRegisterFeature({@required this.pageSliderRepository});

  @override
  _AuthenticationRegisterFeature createState() => _AuthenticationRegisterFeature(pageSliderRepository: this.pageSliderRepository);
}

class _AuthenticationRegisterFeature extends State<AuthenticationRegisterFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _AuthenticationRegisterFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
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
              components: [],
            ),
          ),
        ],
      ),
    );
  }
}
