import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/repository/page_slider_repository.dart';

class PageSlider extends StatefulWidget {
  final List<IPageSlider> components;
  final PageSliderRepository pageSliderRepository;
  final StreamController pagerStreamController;

  PageSlider({
    @required this.components,
    @required this.pageSliderRepository,
    this.pagerStreamController,
  });

  @override
  _PageSlider createState() => _PageSlider(
        components: this.components,
        pageSliderRepository: this.pageSliderRepository,
        pagerStreamController: this.pagerStreamController,
      );
}

class _PageSlider extends State<PageSlider> {
  final List<IPageSlider> components;
  final PageSliderRepository pageSliderRepository;
  final StreamController pagerStreamController;
  PageController pageController;

  _PageSlider({
    @required this.components,
    @required this.pageSliderRepository,
    this.pagerStreamController,
  });

  @override
  void initState() {
    this.pageController = PageController(initialPage: 0);
    this.pageSliderRepository.initial(
          pageController: pageController,
          components: this.components,
          pagerStreamController: this.pagerStreamController,
        );
    super.initState();
  }

  List<Widget> dotItems(int position) {
    List<Widget> components = List<Widget>();

    for (int index = 0; index < this.components.length; index++) {
      components.add(GestureDetector(
        onTap: () {
          this.toPagePosition(index);
        },
        child: Container(
          margin: EdgeInsets.only(right: 6, left: 6),
          height: index == position ? 10 : 8,
          width: index == position ? 10 : 8,
          decoration: BoxDecoration(
              color: index == position
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorLight,
              shape: BoxShape.circle),
        ),
      ));
    }

    return components;
  }

  toPagePosition(int position) {
    this.pageController.animateTo(MediaQuery.of(context).size.width * position,
        duration: Duration(milliseconds: 250), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: PageView.builder(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: this.components.length,
              itemBuilder: (BuildContext context, int index) {
                return this.components[index].component;
              },
            ),
          ),
        ),
      ],
    );
  }
}
