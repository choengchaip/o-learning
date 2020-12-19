import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/page_slider.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/features/authentication/authentication_feature_login.dart';
import 'package:o_learning/features/change_password/change_password_feature.dart';
import 'package:o_learning/repository/page_slider_repository.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPage createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
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
                        component: ChangePasswordFeature(
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
