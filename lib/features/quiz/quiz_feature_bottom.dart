import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class QuizBottomFeature extends StatelessWidget {
  final WidgetSliderRepository widgetSliderRepository;

  QuizBottomFeature({
    @required this.widgetSliderRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                GestureDetector(
                  onTap: () {
                    this.widgetSliderRepository.nextWidget();
                  },
                  child: Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
