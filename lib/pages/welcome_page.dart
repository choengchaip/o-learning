import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/page_slider.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/features/authentication/authentication_feature_login.dart';
import 'package:o_learning/features/discovery/discovery_feature.dart';
import 'package:o_learning/features/discovery_introduce/discovery_feature_introduce.dart';
import 'package:o_learning/features/welcome/welcome_feature.dart';
import 'package:o_learning/repository/page_slider_repository.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
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
                        component: WelcomeFeature(
                          pageSliderRepository: this.pageSliderRepository,
                        ),
                      ),
                      IPageSlider(
                        component: DiscoveryIntroduceFeature(
                          pageSliderRepository: this.pageSliderRepository,
                        ),
                      ),
                      IPageSlider(
                        component: DiscoveryFeature(
                          pageSliderRepository: this.pageSliderRepository,
                        ),
                      ),
                      IPageSlider(
                        component: AuthenticationLoginFeature(
                          pageSliderRepository: this.pageSliderRepository,
                        )
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
