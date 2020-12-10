import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class AuthenticationLoginHomeFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  AuthenticationLoginHomeFeature({@required this.widgetSliderRepository});

  @override
  _AuthenticationLoginHomeFeature createState() =>
      _AuthenticationLoginHomeFeature(
          widgetSliderRepository: this.widgetSliderRepository);
}

class _AuthenticationLoginHomeFeature
    extends State<AuthenticationLoginHomeFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  Timer animatedCounter;
  StreamController<bool> animatedTicker;
  bool _animatedTicker;

  _AuthenticationLoginHomeFeature({@required this.widgetSliderRepository});

  @override
  void initState() {
    this.animatedTicker = StreamController<bool>();
    this._animatedTicker = false;
    this.animatedTicker.add(this._animatedTicker);
    this.animatedCounter = Timer.periodic(Duration(milliseconds: 1500), (_) {
      this._animatedTicker = !this._animatedTicker;
      this.animatedTicker.add(this._animatedTicker);
    });

    super.initState();
  }

  @override
  void dispose() {
    this.animatedTicker.close();
    this.animatedCounter.cancel();
    super.dispose();
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
            padding: EdgeInsets.only(top: 16, bottom: 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    appLocaleRepo.$l('authentication_login', 'sign_up'),
                    style: TextStyle(
                      color: gray,
                      fontSize: fontSizeP,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 32, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('authentication_login', 'title'),
              style: TextStyle(
                  color: dark,
                  fontSize: fontSizeH3,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              child: StreamBuilder(
                stream: animatedTicker.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(!snapshot.hasData){
                    return Container();
                  }

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedPositioned(
                        top: snapshot.data ? 110 : 105,
                        right: 200,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.easeIn,
                        child: Container(
                          child: Image.asset('lib/statics/login_man.png'),
                        ),
                      ),
                      AnimatedPositioned(
                        top: snapshot.data ? 110 : 105,
                        left: 200,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.easeIn,
                        child: Container(
                          child: Image.asset('lib/statics/login_girl.png'),
                        ),
                      ),
                      AnimatedPositioned(
                        top: snapshot.data ? 100 : 90,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.easeIn,
                        child: Container(
                          child: Image.asset('lib/statics/login_old_man.png'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              appLocaleRepo.$l('authentication_login', 'terms_and_conditions'),
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSizeS1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CurveButton(
            title: appLocaleRepo.$l('authentication_login', 'login_button'),
            onPressed: () {
              this.widgetSliderRepository.nextWidget();
            },
          ),
        ],
      ),
    );
  }
}
