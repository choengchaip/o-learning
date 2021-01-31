import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/pages/index.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/score_repository.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScoreSummaryResultFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;
  final ScoreRepository scoreRepository;

  ScoreSummaryResultFeature({
    @required this.pageSliderRepository,
    @required this.scoreRepository,
  });

  @override
  _ScoreSummaryResultFeature createState() => _ScoreSummaryResultFeature(
        pageSliderRepository: this.pageSliderRepository,
        scoreRepository: this.scoreRepository,
      );
}

class _ScoreSummaryResultFeature extends State<ScoreSummaryResultFeature> {
  final PageSliderRepository pageSliderRepository;
  final ScoreRepository scoreRepository;

  _ScoreSummaryResultFeature({
    @required this.pageSliderRepository,
    @required this.scoreRepository,
  });

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return Container(
      color: grayLighter.withOpacity(0.5),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 32),
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: quizRepository.receivePoint.toDouble(),
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.1,
                            cornerStyle: CornerStyle.bothCurve,
                            color: grayLighter,
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: 73,
                              width: 13,
                              color: Theme.of(context).primaryColorLight,
                              enableAnimation: true,
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              angle: 90,
                              widget: Container(
                                child: Text(
                                  quizRepository.receivePoint.toString(),
                                  style: TextStyle(
                                    fontSize: 68,
                                  ),
                                ),
                              ),
                              positionFactor: 0,
                            ),
                            GaugeAnnotation(
                              angle: 90,
                              widget: Container(
                                child: Text(
                                  'EARNED TODAY',
                                  style: TextStyle(
                                    fontSize: fontSizeP,
                                    color: gray,
                                  ),
                                ),
                              ),
                              positionFactor: 0.35,
                            ),
                            GaugeAnnotation(
                              angle: 90,
                              widget: Container(
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 48,
                                ),
                              ),
                              positionFactor: 0.75,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'Lesson complete!\nReach your daily goal!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSizeH4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(
              bottom: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: grayLighter,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Correct answers',
                                  style: TextStyle(
                                    fontSize: fontSizeP,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  quizRepository.receivePoint.toString(),
                                  style: TextStyle(
                                    fontSize: fontSizeP,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Level 1 multiplier',
                                  style: TextStyle(
                                    fontSize: fontSizeP,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'x 1',
                                  style: TextStyle(
                                    fontSize: fontSizeP,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 16,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 4,
                        ),
                        child: Text(
                          'EARNED',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: fontSizeP,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 4,
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            Container(
                              child: Text(
                                quizRepository.receivePoint.toString(),
                                style: TextStyle(
                                  fontSize: fontSizeH4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CurveButton(
            title: 'CONTINUE',
            onPressed: () {
              pageLauncher(Index(), context);
            },
          ),
        ],
      ),
    );
  }
}
