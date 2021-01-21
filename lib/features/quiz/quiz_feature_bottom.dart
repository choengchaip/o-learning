import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class QuizBottomFeature extends StatelessWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final Function onNext;
  final Function onSuccess;

  QuizBottomFeature({
    @required this.widgetSliderRepository,
    @required this.onNext,
    @required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 250,
            ),
            height: 5,
            color: quizRepository.answerWrongAlert ? Colors.red : Colors.green,
          ),
          AnimatedContainer(
            duration: Duration(
              milliseconds: 250,
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            height: quizRepository.answerWrongAlert ? 45 : 0,
            child: Text(
              (quizRepository.currentQuestion?.note) ?? 'ANSWER WRONG !!!',
              style: TextStyle(
                fontSize: fontSizeP,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(
              milliseconds: 250,
            ),
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            height: quizRepository.choiceIds == null
                ? 0
                : quizRepository.choiceIds.isEmpty
                    ? 0
                    : 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  (quizRepository.choiceIds == null
                      ? 0
                      : quizRepository.choiceIds.length), (index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      if (!quizRepository.isAnswerAdded(
                          quizRepository.choiceIds[index]['value'])) {
                        quizRepository.answerEssayQuestion(
                            quizRepository.choiceIds[index]);
                      }
                    },
                    child: Card(
                      color: quizRepository.choiceIds == null
                          ? Colors.white
                          : quizRepository.isAnswerAdded(
                                  quizRepository.choiceIds[index]['value'])
                              ? grayLighter
                              : Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Text(quizRepository.choiceIds[index]['label']),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 12,
              left: 8,
              right: 8,
            ),
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: grayLighter,
                ),
              ),
            ),
            height: 65,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: quizRepository.answerWrongAlert ? 1 : 0,
                  duration: Duration(milliseconds: 250),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          quizRepository.tryAgain();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                          child: Text(
                            'TRY AGAIN',
                            style: TextStyle(
                              fontSize: fontSizeP,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: quizRepository.answerWrongAlert ? 0 : 1,
                  duration: Duration(milliseconds: 250),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          quizRepository.resetChoice();
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  right: 16,
                                ),
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
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: dark,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (this.widgetSliderRepository.activeWidgetIndex ==
                              this.widgetSliderRepository.components.length -
                                  1) {
                            await Future(() {
                              this.onNext();
                            });
                            if (!quizRepository.answerWrongAlert) {
                              this.onSuccess();
                            }
                          } else {
                            if (quizRepository.canAnswer) {
                              this.onNext();
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(
                                !quizRepository.canAnswer ? 0.25 : 1),
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
          ),
        ],
      ),
    );
  }
}
