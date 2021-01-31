import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/pages/authentication_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';

class DiscoveryNotification extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;

  DiscoveryNotification(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository});

  @override
  _DiscoveryNotification createState() => _DiscoveryNotification(
      widgetSliderRepository: this.widgetSliderRepository,
      discoveryWidgetRepository: this.discoveryWidgetRepository);
}

class _DiscoveryNotification extends State<DiscoveryNotification> {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  StreamController<DateTime> dateTime;

  _DiscoveryNotification(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository});

  @override
  void initState() {
    this.dateTime = StreamController<DateTime>();
    this.dateTime.add(DateTime.now());
    super.initState();
  }

  Future requestNotificationPermission() async {
    PermissionStatus permissionStatus =
        await NotificationPermissions.getNotificationPermissionStatus();
    if (permissionStatus != PermissionStatus.granted) {
      await NotificationPermissions.requestNotificationPermissions();
    }

    this.proceed();
  }

  void proceed() {
    pageLauncher(AuthenticationPage(), context);
  }

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository = Provider.of<AuthRepository>(context);
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              appLocaleRepo.$l('discovery_notification', 'header'),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fontSizeP,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 32, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('discovery_notification', 'title'),
              style: TextStyle(
                  color: dark,
                  fontSize: fontSizeH3,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16, bottom: 16),
                    height: 175,
                    child:
                        Image.asset('lib/statics/discovery_notification.png'),
                  ),
                  Container(
                    child: Text(
                      appLocaleRepo.$l('discovery_notification', 'note'),
                      style: TextStyle(fontSize: fontSizeP, color: gray),
                    ),
                  ),
                  StreamBuilder<DateTime>(
                    stream: dateTime.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      return GestureDetector(
                        onTap: () {
                          DatePicker.showTimePicker(
                            context,
                            showSecondsColumn: false,
                            locale: appLocaleRepo.locale == 'th'
                                ? LocaleType.th
                                : LocaleType.en,
                            onConfirm: (DateTime dateTime) {
                              this.dateTime.add(dateTime);
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 16),
                          padding:
                              EdgeInsets.only(top: 14, bottom: 14, left: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 1),
                                  blurRadius: 6,
                                  spreadRadius: 1)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                child: Text(
                                  '${snapshot.data.hour < 10 ? '0${snapshot.data.hour}' : snapshot.data.hour}:${snapshot.data.minute < 10 ? '0${snapshot.data.minute}' : snapshot.data.minute}',
                                  style: TextStyle(fontSize: fontSizeH5),
                                ),
                              ),
                              Container(
                                child: Icon(Icons.keyboard_arrow_down),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          CurveButton(
            title: appLocaleRepo.$l(
                'discovery_notification', 'enable_notification_button'),
            onPressed: () {
              authRepository.setCourseId(this.discoveryWidgetRepository.courseId);
              this.requestNotificationPermission();
            },
          ),
          GestureDetector(
            onTap: (){
              authRepository.setCourseId(this.discoveryWidgetRepository.courseId);
              this.proceed();
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                appLocaleRepo.$l('discovery_notification', 'not_now'),
                style: TextStyle(fontSize: fontSizeH4, color: gray),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
