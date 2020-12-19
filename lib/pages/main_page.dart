import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/components/bottom_menu.dart';
import 'package:o_learning/components/page_slider.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/features/account/account_feature.dart';
import 'package:o_learning/features/category/categories_feature.dart';
import 'package:o_learning/features/course/course_feature.dart';
import 'package:o_learning/features/leader_board/leader_board_feature.dart';
import 'package:o_learning/features/quiz/quiz_feature.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/states/types.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  PageSliderRepository pageSliderRepository = new PageSliderRepository();
  StreamController<int> currentMenu;

  @override
  void initState() {
    this.currentMenu = StreamController<int>();
    this.currentMenu.add(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: PageSlider(
                      pageSliderRepository: this.pageSliderRepository,
                      pagerStreamController: this.currentMenu,
                      components: [
                        IPageSlider(
                          component: CourseFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                        IPageSlider(
                          component: CategoriesFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                        IPageSlider(
                          component: LeaderBoardFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                        IPageSlider(
                          component: AccountFeature(
                            pageSliderRepository: this.pageSliderRepository,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: StreamBuilder<int>(
                      stream: currentMenu.stream,
                      builder: (BuildContext context, snapshot) {
                        return IgnorePointer(
                          ignoring: quizRepository.status.isLoading,
                          child: AnimatedOpacity(
                            opacity: quizRepository.status.isLoading ? 0.5 : 1,
                            duration: Duration(milliseconds: 250),
                            child: BottomMenu(
                              currentMenu: snapshot.data,
                              onChanged: (int menu) {
                                this.currentMenu.add(menu);
                                switch (menu) {
                                  case 0:
                                    this.pageSliderRepository.toPage(0);
                                    break;
                                  case 1:
                                    this.pageSliderRepository.toPage(1);
                                    break;
                                  case 2:
                                    this.pageSliderRepository.toPage(2);
                                    break;
                                  case 3:
                                    this.pageSliderRepository.toPage(3);
                                    break;
                                  default:
                                    this.pageSliderRepository.toPage(0);
                                }
                              },
                              menuItems: [
                                IBottomMenuType(
                                  icon: Icons.flag,
                                  title: appLocaleRepo.$l(
                                      'main_page', 'course_menu'),
                                  menuType: BottomMenuType.COURSE,
                                ),
                                IBottomMenuType(
                                  icon: Icons.book_rounded,
                                  title: appLocaleRepo.$l(
                                      'main_page', 'subject_menu'),
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
                                  title: appLocaleRepo.$l(
                                      'main_page', 'account_menu'),
                                  menuType: BottomMenuType.ACCOUNT,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            QuizFeature(),
          ],
        ),
      ),
    );
  }
}
