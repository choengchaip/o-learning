import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/welcome/welcome_page_detail.dart';
import 'package:o_learning/pages/discovery_introduce_page.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/utils/page_helper.dart';

class WelcomeFeature extends StatefulWidget {
  @override
  _WelcomeFeature createState() => _WelcomeFeature();
}

class _WelcomeFeature extends State<WelcomeFeature> {
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    'LOG IN',
                    style: TextStyle(color: gray, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: WidgetSlider(
              widgetSliderRepository: this.widgetSliderRepository,
              components: [
                IWidgetSlider(
                    component: WelcomePageDetail(
                      logoImage: 'lib/statics/mock_logo.png',
                      title: 'Learn to code',
                      description:
                          'Master the skills to read and write code,\nbuild apps and games, and advance\n your career',
                    ),
                    buttonTitle: 'GET STARTED'),
                IWidgetSlider(
                    component: WelcomePageDetail(
                      logoImage: 'lib/statics/mock_logo.png',
                      title: 'Build projects',
                      description:
                          'Make apps, games, websites, and more\nwith step-by-step guidance',
                    ),
                    buttonTitle: 'GET STARTED'),
                IWidgetSlider(
                    component: WelcomePageDetail(
                      logoImage: 'lib/statics/mock_logo.png',
                      title: 'Join the community',
                      description:
                          'Get advice and inspiration from more\nthan 5 million learners',
                    ),
                    buttonTitle: 'GET STARTED'),
              ],
            ),
          ),
          CurveButton(
            title: 'GET STARTED',
            onPressed: () {
              pageLauncher(DiscoveryIntroducePage(), context);
            },
          ),
        ],
      ),
    );
  }
}
