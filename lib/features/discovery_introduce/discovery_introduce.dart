import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/pages/discovery_page.dart';
import 'package:o_learning/utils/page_helper.dart';

class DiscoveryIntroduceFeature extends StatefulWidget {
  @override
  _DiscoveryIntroduceFeature createState() => _DiscoveryIntroduceFeature();
}

class _DiscoveryIntroduceFeature extends State<DiscoveryIntroduceFeature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              'INTRODUCTION',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Welcome to OLearning!',
              style: TextStyle(
                  color: dark, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Before you get started, we\'ll ask you a few\nquestions to create your personalized\ncurriculum. Are you ready?',
              style: TextStyle(
                  color: gray, fontSize: 14, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.only(left: 16, right: 16),
              padding: EdgeInsets.all(64),
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      onPressed: () {
                        pageLauncher(DiscoveryPage(), context);
                      },
                      child: Text(
                        'LET\'S GO',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
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
