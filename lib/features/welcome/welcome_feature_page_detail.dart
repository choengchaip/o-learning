// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';

class WelcomePageDetail extends StatefulWidget {
  final String logoImage;
  final String title;
  final String description;

  WelcomePageDetail({
    this.logoImage,
    this.title,
    this.description,
  });

  @override
  _WelcomePageDetail createState() => _WelcomePageDetail(
        logoImage: this.logoImage,
        title: this.title,
        description: this.description,
      );
}

class _WelcomePageDetail extends State<WelcomePageDetail> {
  final String logoImage;
  final String title;
  final String description;

  _WelcomePageDetail({
    this.logoImage,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16, left: 46, right: 64),
            height: 250,
            child: Image.asset(this.logoImage),
            decoration: BoxDecoration(shape: BoxShape.circle),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              this.title,
              style: TextStyle(fontSize: fontSizeH3, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32, left: 16, right: 16),
            child: Text(
              this.description,
              style: TextStyle(fontSize: fontSizeP, color: gray),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
