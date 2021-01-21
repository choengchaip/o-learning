import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/loading.dart';
import 'package:o_learning/pages/change_password_page.dart';
import 'package:o_learning/pages/welcome_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/account_data_types.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class AccountHomeFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final IAccountItem mockAccountItem;

  AccountHomeFeature({
    @required this.widgetSliderRepository,
    this.mockAccountItem,
  });

  @override
  _AccountHomeFeature createState() => _AccountHomeFeature(
        widgetSliderRepository: this.widgetSliderRepository,
        mockAccountItem: this.mockAccountItem,
      );
}

class _AccountHomeFeature extends State<AccountHomeFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final IAccountItem mockAccountItem;

  _AccountHomeFeature({
    @required this.widgetSliderRepository,
    this.mockAccountItem,
  });

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    AuthRepository authRepo = Provider.of<AuthRepository>(context);

    return Loading(
      isLoading: authRepo.status.isLoading,
      component: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                bottom: 16,
                left: 16,
                right: 16,
              ),
              color: Theme.of(context).primaryColorLight,
              child: Text(
                appLocaleRepo.$l('account', 'title'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeP,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: this.mockAccountItem.imageUrl,
                        ).image,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              authRepo.nameText,
                              style: TextStyle(
                                fontSize: fontSizeH5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              authRepo.emailText,
                              style: TextStyle(
                                fontSize: fontSizeP,
                                color: gray,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ChangePasswordPage()));
                            },
                            child: Container(
                              child: Text(
                                appLocaleRepo.$l(
                                    'account', 'change_password_button'),
                                style: TextStyle(
                                  fontSize: fontSizeP,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: ListView(
                  padding: EdgeInsets.all(8),
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 1),
                        ],
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 16,
                                  ),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 64,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '10',
                                    style: TextStyle(fontSize: fontSizeH1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 16,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              appLocaleRepo.$l('account', 'star_description'),
                              style: TextStyle(
                                color: gray,
                                fontSize: fontSizeS1,
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    this.widgetSliderRepository.toPage(1);
                                  },
                                  child: Container(
                                    // margin: EdgeInsets.only(
                                    //   right: 16,
                                    // ),
                                    child: Text(
                                      appLocaleRepo.$l(
                                          'account', 'quiz_button'),
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                // Container(
                                //   child: Text(
                                //     appLocaleRepo.$l('account', 'coupon_shop_button'),
                                //     style: TextStyle(
                                //       color: Theme.of(context).primaryColor,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 1),
                        ],
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 16,
                                  ),
                                  child: Icon(
                                    Icons.leaderboard,
                                    color: Colors.green,
                                    size: 64,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '10',
                                    style: TextStyle(fontSize: fontSizeH1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 16,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              appLocaleRepo.$l('account', 'score_description'),
                              style: TextStyle(
                                color: gray,
                                fontSize: fontSizeS1,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              this.widgetSliderRepository.toPage(2);
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Text(
                                      appLocaleRepo.$l(
                                          'account', 'score_button'),
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await authRepo.logout();
                pageLauncher(WelcomePage(), context);
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.redAccent,
                padding: EdgeInsets.all(16),
                child: Text('Log out',
                    style: TextStyle(
                      fontSize: fontSizeH4,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
