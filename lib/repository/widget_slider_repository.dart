import 'package:flutter/cupertino.dart';
import 'package:o_learning/components/types.dart';

class WidgetSliderRepository extends ChangeNotifier {
  PageController pageController;
  List<IWidgetSlider> components;
  int activeIndex;

  initial({PageController pageController, List<IWidgetSlider> components}) {
    this.pageController = pageController;
    this.components = components;
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
    }
  }
}
