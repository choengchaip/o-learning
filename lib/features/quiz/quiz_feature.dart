import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/loading_item.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/quiz/quiz_feature_bottom.dart';
import 'package:o_learning/features/quiz/quiz_feature_item.dart';
import 'package:o_learning/features/quiz/quiz_feature_navbar.dart';
import 'package:o_learning/features/quiz/quiz_feature_progress.dart';
import 'package:o_learning/pages/score_summary_page.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class QuizFeature extends StatefulWidget {
  _QuizFeature createState() => _QuizFeature();
}

class _QuizFeature extends State<QuizFeature> {
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();
  StreamController<bool> positionController;
  StreamController<double> progressController;
  bool isHasRun;

  @override
  void initState() {
    this.positionController = StreamController<bool>();
    this.progressController = StreamController<double>();
    this.positionController.add(false);
    this.progressController.add(0);
    this.isHasRun = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return Stack(
      children: [
        StreamBuilder<bool>(
          stream: positionController.stream,
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            } else {
              if (!this.isHasRun) {
                this.isHasRun = true;
                this.positionController.add(true);
              }
            }

            return AnimatedPositioned(
              top: snapshot.data ? 0 : MediaQuery.of(context).size.height,
              duration: Duration(milliseconds: 250),
              curve: Curves.ease,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: IgnorePointer(
                ignoring: quizRepository.status.isLoading,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      QuizNavBarFeature(
                        onClose: () async {
                          quizRepository.answerWrongAlert = false;
                          quizRepository.resetAnswer();
                          this.positionController.add(false);
                          await Future.delayed(Duration(milliseconds: 250), () {
                            quizRepository.hideQuizFeature();
                            quizRepository.disposeChoices();
                          });
                        },
                      ),
                      StreamBuilder<double>(
                        stream: progressController.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          }

                          if (this.widgetSliderRepository.activeWidgetIndex ==
                              0) {
                            this.progressController.add(
                                (MediaQuery.of(context).size.width * 1) /
                                    quizRepository.findItem.totalQuestion);
                          }

                          return QuizProgressFeature(
                            progress: snapshot.data,
                          );
                        },
                      ),
                      Expanded(
                        child: WidgetSlider(
                          widgetSliderRepository: this.widgetSliderRepository,
                          scrollable: false,
                          showDot: false,
                          components: List.generate(
                              quizRepository.findItem.questions.length,
                              (index) {
                            return IWidgetSlider(
                              component: QuizItemFeature(
                                questionItem:
                                    quizRepository.findItem.questions[index],
                              ),
                            );
                          }),
                        ),
                      ),
                      QuizBottomFeature(
                        widgetSliderRepository: this.widgetSliderRepository,
                        onSuccess: () async {
                          quizRepository.answerWrongAlert = false;
                          // quizRepository.resetAnswer();
                          this.positionController.add(false);
                          await Future.delayed(Duration(milliseconds: 250), () {
                            quizRepository.hideQuizFeature();
                            quizRepository.disposeChoices();
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ScoreSummaryPage(
                              quizRepository: quizRepository,
                            )));
                          });
                        },
                        onNext: () {
                          quizRepository.answerQuestion();
                          if (!quizRepository.answerWrongAlert) {
                            this.widgetSliderRepository.nextWidget();
                            quizRepository.currentChoiceId = '';
                            quizRepository.currentQuestionId = '';
                            this.progressController.add(num.parse(
                                    ((MediaQuery.of(context).size.width *
                                                (this
                                                        .widgetSliderRepository
                                                        .activeWidgetIndex +
                                                    1)) /
                                            quizRepository
                                                .findItem.totalQuestion)
                                        .toStringAsFixed(8))
                                .toDouble());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        LoadingItem(
          message: 'Submit Score ...',
          isLoading: quizRepository.status.isLoading,
        ),
      ],
    );
  }
}
