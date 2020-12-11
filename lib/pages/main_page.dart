import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/bottom_menu.dart';
import 'package:o_learning/components/page_slider.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/features/main/main_feature_account.dart';
import 'package:o_learning/features/main/main_feature_course.dart';
import 'package:o_learning/features/main/main_feature_leader_board.dart';
import 'package:o_learning/features/main/main_feature_subject.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/states/types.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  PageSliderRepository pageSliderRepository = new PageSliderRepository();
  StreamController<BottomMenuType> currentMenu;

  @override
  void initState() {
    this.currentMenu = StreamController<BottomMenuType>();
    this.currentMenu.add(BottomMenuType.COURSE);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(),
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: PageSlider(
                      pageSliderRepository: this.pageSliderRepository,
                      components: [
                        IPageSlider(
                          component: MainCourseFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                        IPageSlider(
                          component: MainSubjectFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                        IPageSlider(
                          component: MainLeaderBoardFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                        IPageSlider(
                          component: MainAccountFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: StreamBuilder<BottomMenuType>(
                      stream: currentMenu.stream,
                      builder: (BuildContext context, snapshot){
                        return BottomMenu(
                          currentMenu: snapshot.data,
                          onChanged: (BottomMenuType menu) {
                            this.currentMenu.add(menu);
                            switch (menu) {
                              case BottomMenuType.COURSE:
                                this.pageSliderRepository.toPage(0);
                                break;
                              case BottomMenuType.SUBJECT:
                                this.pageSliderRepository.toPage(1);
                                break;
                              case BottomMenuType.LEADER_BOARD:
                                this.pageSliderRepository.toPage(2);
                                break;
                              case BottomMenuType.ACCOUNT:
                                this.pageSliderRepository.toPage(3);
                                break;
                              default:
                                this.pageSliderRepository.toPage(0);
                            }
                          },
                          menuItems: [
                            IBottomMenuType(
                              icon: Icons.flag,
                              title: appLocaleRepo.$l('main_page', 'course_menu'),
                              menuType: BottomMenuType.COURSE,
                            ),
                            IBottomMenuType(
                              icon: Icons.book_rounded,
                              title: appLocaleRepo.$l('main_page', 'subject_menu'),
                              menuType: BottomMenuType.SUBJECT,
                            ),
                            IBottomMenuType(
                              icon: Icons.stars,
                              title: appLocaleRepo.$l(
                                  'main_page', 'leader_board_menu'),
                              menuType: BottomMenuType.LEADER_BOARD,
                            ),
                            IBottomMenuType(
                              icon: Icons.person,
                              title: appLocaleRepo.$l('main_page', 'account_menu'),
                              menuType: BottomMenuType.ACCOUNT,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
