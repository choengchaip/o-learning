import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/bottom_menu.dart';
import 'package:o_learning/components/page_slider.dart';
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
                      components: [],
                    ),
                  ),
                  SafeArea(
                    child: BottomMenu(
                      onChanged: (BottomMenuType menu) {
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
                          case BottomMenuType.PROFILE:
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
                          menuType: null,
                        ),
                        IBottomMenuType(
                          icon: Icons.book_rounded,
                          title: appLocaleRepo.$l('main_page', 'subject_menu'),
                          menuType: null,
                        ),
                        IBottomMenuType(
                          icon: Icons.stars,
                          title: appLocaleRepo.$l(
                              'main_page', 'leader_board_menu'),
                          menuType: null,
                        ),
                        IBottomMenuType(
                          icon: Icons.person,
                          title: appLocaleRepo.$l('main_page', 'account_menu'),
                          menuType: null,
                        )
                      ],
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
