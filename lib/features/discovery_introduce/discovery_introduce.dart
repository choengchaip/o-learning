import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/pages/discovery_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';

class DiscoveryIntroduceFeature extends StatefulWidget {
  @override
  _DiscoveryIntroduceFeature createState() => _DiscoveryIntroduceFeature();
}

class _DiscoveryIntroduceFeature extends State<DiscoveryIntroduceFeature> {
  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              appLocaleRepo.$l('discovery_intro', 'header'),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              appLocaleRepo.$l('discovery_intro', 'title'),
              style: TextStyle(
                  color: dark, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            child: Text(
              appLocaleRepo.$l('discovery_intro', 'description'),
              style: TextStyle(
                  color: gray, fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(64),
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset('lib/statics/mock_logo.png'),
              ),
            ),
          ),
          CurveButton(
            title: appLocaleRepo.$l('discovery_intro', 'let_go_button'),
            onPressed: () {
              pageLauncher(DiscoveryPage(), context);
            },
          ),
        ],
      ),
    );
  }
}
