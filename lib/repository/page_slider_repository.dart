import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:o_learning/components/types.dart';

class PageSliderRepository {
  PageController pageController;
  List<IPageSlider> components;
  StreamController pageStreamController;
  int activeIndex;

  initial({PageController pageController, List<IPageSlider> components, StreamController pagerStreamController}) {
    this.pageController = pageController;
    this.components = components;
    this.pageStreamController = pagerStreamController;
    this.activeIndex = 0;
  }

  nextPage() {
    this.toPage(this.activeIndex + 1);
  }

  prevPage() {
    this.toPage(this.activeIndex - 1);
  }

  toPage(int position) {
    if (position < 0) {
      position = 0;
    }
    if (position < this.components.length) {
      this.activeIndex = position;
      this.pageController.animateToPage(position,
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      if(this.pageStreamController != null){
        this.pageStreamController.add(position);
      }
    }
  }
}
