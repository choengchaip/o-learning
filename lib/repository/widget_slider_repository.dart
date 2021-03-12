// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/repository/page_slider_repository.dart';

class WidgetSliderRepository extends ChangeNotifier {
  PageSliderRepository pageSliderRepo;
  PageController widgetController;
  List<IWidgetSlider> components;
  int activeWidgetIndex;

  initial(
      {PageSliderRepository pageSliderRepo,
      PageController widgetController,
      List<IWidgetSlider> components}) {
    this.widgetController = widgetController;
    this.components = components;
    this.activeWidgetIndex = 0;

    if (pageSliderRepo != null) {
      this.pageSliderRepo = pageSliderRepo;
    }
    notifyListeners();
  }

  nextPage() {
    this.pageSliderRepo.nextPage();
  }

  prevPage() {
    this.pageSliderRepo.prevPage();
  }

  toPage(int position) {
    this.pageSliderRepo.toPage(position);
  }

  nextWidget() {
    this.toWidget(this.activeWidgetIndex + 1);
  }

  prevWidget() {
    this.toWidget(this.activeWidgetIndex - 1);
  }

  toWidget(int position) {
    if (position < 0) {
      position = 0;
    }
    if (position < this.components.length) {
      this.activeWidgetIndex = position;
      this.widgetController.animateToPage(position,
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    }
    notifyListeners();
  }
}
