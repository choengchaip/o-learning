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
                    child: StreamBuilder<BottomMenuType>(
                      stream: currentMenu.stream,
                      builder: (BuildContext context, snapshot) {
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
                              title:
                                  appLocaleRepo.$l('main_page', 'course_menu'),
                              menuType: BottomMenuType.COURSE,
                            ),
                            IBottomMenuType(
                              icon: Icons.book_rounded,
                              title:
                                  appLocaleRepo.$l('main_page', 'subject_menu'),
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
                              title:
                                  appLocaleRepo.$l('main_page', 'account_menu'),
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
            AnimatedPositioned(
              top: quizRepository.expandQuiz
                  ? 0
                  : MediaQuery.of(context).size.height,
              duration: Duration(milliseconds: 150),
              curve: Curves.ease,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              quizRepository.hideQuizFeature();
                            },
                            child: Container(
                              child: Icon(
                                Icons.close,
                                color: gray,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: grayLighter,
                        boxShadow: [
                          BoxShadow(
                              color: grayLight,
                              offset: Offset(0, 0.75),
                              blurRadius: 4,
                              spreadRadius: 0),
                        ],
                      ),
                      height: 8,
                      width: MediaQuery.of(context).size.width,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 150),
                        curve: Curves.ease,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        height: 8,
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                    ),
                    Expanded(child: Center(child: Container(child: Text('Quiz feature'),))),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 5,
                            color: Colors.green,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 12,
                              bottom: 12,
                              left: 8,
                              right: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColorDark,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.code,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                    size: 32,
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
          ],
        ),
      ),
    );
  }
}
