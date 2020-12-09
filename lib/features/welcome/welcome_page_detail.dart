import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';

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
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              this.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32),
            child: Text(
              this.description,
              style: TextStyle(fontSize: 16, color: gray),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
