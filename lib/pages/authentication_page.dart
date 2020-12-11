import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/page_slider.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/features/authentication/authentication_feature_login.dart';
import 'package:o_learning/features/authentication/authentication_feature_register.dart';
import 'package:o_learning/repository/page_slider_repository.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPage createState() => _AuthenticationPage();
}

class _AuthenticationPage extends State<AuthenticationPage> {
  PageSliderRepository pageSliderRepository = new PageSliderRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: PageSlider(
                    pageSliderRepository: this.pageSliderRepository,
                    components: [
                      IPageSlider(
                        component: AuthenticationLoginFeature(
                          pageSliderRepository: this.pageSliderRepository,
                        ),
                      ),
                      IPageSlider(
                        component: AuthenticationRegisterFeature(
                          pageSliderRepository: this.pageSliderRepository,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
