import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class WidgetSlider extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final List<IWidgetSlider> components;
  final bool showDot;
  final bool scrollable;

  WidgetSlider(
      {@required this.widgetSliderRepository,
      @required this.components,
      this.showDot,
      this.scrollable});

  @override
  _WidgetSlider createState() => _WidgetSlider(
      widgetSliderRepository: this.widgetSliderRepository,
      components: this.components,
      showDot: this.showDot,
      scrollable: this.scrollable);
}

class _WidgetSlider extends State<WidgetSlider> {
  final WidgetSliderRepository widgetSliderRepository;
  final List<IWidgetSlider> components;
  bool showDot;
  bool scrollable;

  PageController widgetController;
  StreamController<int> activeIndex;

  _WidgetSlider(
      {@required this.widgetSliderRepository,
      @required this.components,
      this.showDot,
      this.scrollable}) {
    if (this.showDot == null) {
      this.showDot = true;
    }
    if (this.scrollable == null) {
      this.scrollable = true;
    }
  }

  @override
  void initState() {
    this.activeIndex = StreamController<int>();
    this.activeIndex.add(0);
    this.widgetController = PageController(initialPage: 0);
    this.widgetSliderRepository.initial(
        widgetController: this.widgetController, components: this.components);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    this.activeIndex.close();
  }

  List<Widget> dotItems(int position) {
    List<Widget> components = List<Widget>();

    for (int index = 0; index < this.components.length; index++) {
      components.add(Container(
        margin: EdgeInsets.only(right: 6, left: 6),
        height: index == position ? 10 : 8,
        width: index == position ? 10 : 8,
        decoration: BoxDecoration(
            color: index == position
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColorLight,
            shape: BoxShape.circle),
      ));
    }

    return components;
  }

  toPagePosition(int position) {
    if (position < this.components.length) {
      this.activeIndex.add(position);
      this.widgetController.animateToPage(position,
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              physics: this.scrollable
                  ? AlwaysScrollableScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              onPageChanged: (int position) {
                this.activeIndex.add(position);
              },
              scrollDirection: Axis.horizontal,
              controller: widgetController,
              itemCount: this.components.length,
              itemBuilder: (BuildContext context, int index) {
                return this.components[index].component;
              },
            ),
          ),
        ),
        showDot
            ? StreamBuilder(
                stream: activeIndex.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: this.dotItems(snapshot.data),
                      ),
                    );
                  }
                  return Container();
                },
              )
            : Container(),
      ],
    );
  }
}
