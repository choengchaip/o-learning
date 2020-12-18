import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class LeaderBoardFriendFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  LeaderBoardFriendFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _LeaderBoardFriendFeature createState() => _LeaderBoardFriendFeature(
        widgetSliderRepository: this.widgetSliderRepository,
      );
}

class _LeaderBoardFriendFeature extends State<LeaderBoardFriendFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  _LeaderBoardFriendFeature({
    @required this.widgetSliderRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
