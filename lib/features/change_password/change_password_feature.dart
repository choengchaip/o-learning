import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/change_password/change_password_feature_confirm_password.dart';
import 'package:o_learning/features/change_password/change_password_feature_new_password.dart';
import 'package:o_learning/features/change_password/change_password_feature_password.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class ChangePasswordFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  ChangePasswordFeature({@required this.pageSliderRepository});

  @override
  _ChangePasswordFeature createState() => _ChangePasswordFeature(pageSliderRepository: this.pageSliderRepository);
}

class _ChangePasswordFeature extends State<ChangePasswordFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _ChangePasswordFeature({@required this.pageSliderRepository});

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
              components: [
                IWidgetSlider(
                  component: ChangePasswordPasswordFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: ChangePasswordNewPasswordFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: ChangePasswordConfirmPasswordFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
