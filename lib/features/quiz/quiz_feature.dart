import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/quiz/quiz_feature_bottom.dart';
import 'package:o_learning/features/quiz/quiz_feature_navbar.dart';
import 'package:o_learning/features/quiz/quiz_feature_progress.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class QuizFeature extends StatefulWidget {
  _QuizFeature createState() => _QuizFeature();
}

class _QuizFeature extends State<QuizFeature> {
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return AnimatedPositioned(
      top: quizRepository.expandQuiz ? 0 : MediaQuery.of(context).size.height,
      duration: Duration(milliseconds: 150),
      curve: Curves.ease,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            QuizNavBarFeature(),
            QuizProgressFeature(),
            Expanded(
              child: WidgetSlider(
                widgetSliderRepository: this.widgetSliderRepository,
                scrollable: false,
                showDot: false,
                components: [
                  IWidgetSlider(
                    component: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Text('Quiz feature'),
                    ),
                  ),
                ],
              ),
            ),
            QuizBottomFeature(),
          ],
        ),
      ),
    );
  }
}
