import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/page_slider.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/features/score_summary/score_summary_calculating_feature.dart';
import 'package:o_learning/features/score_summary/score_summary_result_feature.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/score_repository.dart';

class ScoreSummaryPage extends StatefulWidget {
  final QuizRepository quizRepository;

  ScoreSummaryPage({
    @required this.quizRepository,
  });

  @override
  _ScoreSummaryPage createState() => _ScoreSummaryPage(
        quizRepository: this.quizRepository,
      );
}

class _ScoreSummaryPage extends State<ScoreSummaryPage> {
  final QuizRepository quizRepository;
  PageSliderRepository pageSliderRepository = new PageSliderRepository();
  ScoreRepository scoreRepository = ScoreRepository();

  _ScoreSummaryPage({
    @required this.quizRepository,
  });

  @override
  void initState() {
    scoreRepository.initial(
      quizRepository: this.quizRepository,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: PageSlider(
                    pageSliderRepository: this.pageSliderRepository,
                    components: [
                      IPageSlider(
                        component: ScoreSummaryCalculatingFeature(
                          pageSliderRepository: this.pageSliderRepository,
                          scoreRepository: this.scoreRepository,
                        ),
                      ),
                      IPageSlider(
                        component: ScoreSummaryResultFeature(
                          pageSliderRepository: this.pageSliderRepository,
                          scoreRepository: this.scoreRepository,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
