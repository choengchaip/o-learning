import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class DiscoveryIntroduceFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  DiscoveryIntroduceFeature({@required this.pageSliderRepository});

  @override
  _DiscoveryIntroduceFeature createState() => _DiscoveryIntroduceFeature(
      pageSliderRepository: this.pageSliderRepository);
}

class _DiscoveryIntroduceFeature extends State<DiscoveryIntroduceFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _DiscoveryIntroduceFeature({@required this.pageSliderRepository});


  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              appLocaleRepo.$l('discovery_intro', 'header'),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fontSizeP,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              appLocaleRepo.$l('discovery_intro', 'title'),
              style: TextStyle(
                  color: dark,
                  fontSize: fontSizeH3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            child: Text(
              appLocaleRepo.$l('discovery_intro', 'description'),
              style: TextStyle(
                  color: gray,
                  fontSize: fontSizeP,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(64),
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset('lib/statics/logo.png'),
              ),
            ),
          ),
          CurveButton(
            title: appLocaleRepo.$l('discovery_intro', 'let_go_button'),
            onPressed: () {
              this.widgetSliderRepository.nextPage();
            },
          ),
        ],
      ),
    );
  }
}
