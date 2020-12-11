import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(),
              Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Main Page',
                              style: TextStyle(
                                fontSize: fontSizeH1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, -0.5),
                              blurRadius: 6,
                              spreadRadius: 1),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.flag),
                                ),
                                Container(
                                  child: Text('Path'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.menu_book_rounded),
                                ),
                                Container(
                                  child: Text('Browse'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.stars),
                                ),
                                Container(
                                  child: Text('Leaderboard'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.account_circle_rounded),
                                ),
                                Container(
                                  child: Text('Profile'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
