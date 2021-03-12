// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/authentication/authentication_feature_login.dart';
import 'package:o_learning/features/welcome/welcome_feature_page_detail.dart';
import 'package:o_learning/pages/authentication_page.dart';
import 'package:o_learning/pages/index.dart';
import 'package:o_learning/pages/main_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';

class WelcomeFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  WelcomeFeature({@required this.pageSliderRepository});

  @override
  _WelcomeFeature createState() => _WelcomeFeature(pageSliderRepository: this.pageSliderRepository);
}

class _WelcomeFeature extends State<WelcomeFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _WelcomeFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    AuthRepository authRepo =
    Provider.of<AuthRepository>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // GestureDetector(
                //   onTap: (){
                //     authRepo.login();
                //     pageLauncher(Index(), context);
                //   },
                //   child: Container(
                //     child: Text(
                //       'คลิกเพื่อข้ามขั้นตอน (ทดสอบ)',
                //       style: TextStyle(
                //         color: Theme.of(context).primaryColor,
                //         fontSize: fontSizeP,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: (){
                    // pageLauncher(MainPage(), context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => AuthenticationPage()));
                  },
                  child: Container(
                    child: Text(
                      appLocaleRepo.$l('welcome', 'login_button'),
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
          Expanded(
            child: WidgetSlider(
              widgetSliderRepository: this.widgetSliderRepository,
              components: [
                IWidgetSlider(
                    component: WelcomePageDetail(
                      logoImage: 'lib/statics/logo.png',
                      title: appLocaleRepo.$l('welcome', 'learn_to_code_title'),
                      description: appLocaleRepo.$l(
                          'welcome', 'learn_to_code_description'),
                    ),
                    buttonTitle:
                        appLocaleRepo.$l('welcome', 'get_started_button')),
                IWidgetSlider(
                    component: WelcomePageDetail(
                      logoImage: 'lib/statics/logo.png',
                      title: appLocaleRepo.$l('welcome', 'build_project_title'),
                      description: appLocaleRepo.$l(
                          'welcome', 'build_project_description'),
                    ),
                    buttonTitle:
                        appLocaleRepo.$l('welcome', 'get_started_button')),
                IWidgetSlider(
                    component: WelcomePageDetail(
                      logoImage: 'lib/statics/logo.png',
                      title: appLocaleRepo.$l('welcome', 'join_community_title'),
                      description: appLocaleRepo.$l(
                          'welcome', 'join_community_description'),
                    ),
                    buttonTitle:
                        appLocaleRepo.$l('welcome', 'get_started_button')),
              ],
            ),
          ),
          CurveButton(
            margin: EdgeInsets.only(left: 16, right: 16),
            title: appLocaleRepo.$l('welcome', 'get_started_button'),
            onPressed: () {
              this.widgetSliderRepository.nextPage();
            },
          ),
        ],
      ),
    );
  }
}
