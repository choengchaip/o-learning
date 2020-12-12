import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class MainAccountFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  MainAccountFeature({@required this.pageSliderRepository});

  @override
  _MainAccountFeature createState() => _MainAccountFeature(pageSliderRepository: this.pageSliderRepository);
}

class _MainAccountFeature extends State<MainAccountFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _MainAccountFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Account Page'),
            ),
          )
        ],
      ),
    );
  }
}
