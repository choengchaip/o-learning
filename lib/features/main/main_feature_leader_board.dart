import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class MainLeaderBoardFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  MainLeaderBoardFeature({@required this.pageSliderRepository});

  @override
  _MainLeaderBoardFeature createState() => _MainLeaderBoardFeature(pageSliderRepository: this.pageSliderRepository);
}

class _MainLeaderBoardFeature extends State<MainLeaderBoardFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _MainLeaderBoardFeature({@required this.pageSliderRepository});

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
              child: Text('Score Page'),
            ),
          )
        ],
      ),
    );
  }
}
