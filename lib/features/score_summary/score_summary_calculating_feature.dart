// @dart=2.9

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/loading_item.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/score_repository.dart';

class ScoreSummaryCalculatingFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;
  final ScoreRepository scoreRepository;

  ScoreSummaryCalculatingFeature({
    @required this.pageSliderRepository,
    @required this.scoreRepository,
  });

  @override
  _ScoreSummaryCalculatingFeature createState() =>
      _ScoreSummaryCalculatingFeature(
        pageSliderRepository: this.pageSliderRepository,
        scoreRepository: this.scoreRepository,
      );
}

class _ScoreSummaryCalculatingFeature
    extends State<ScoreSummaryCalculatingFeature> {
  final PageSliderRepository pageSliderRepository;
  final ScoreRepository scoreRepository;
  StreamController<bool> loadingController;

  _ScoreSummaryCalculatingFeature({
    @required this.pageSliderRepository,
    @required this.scoreRepository,
  });

  @override
  void initState() {
    this.loadingController = StreamController<bool>();
    this.scoreRepository.initial(loadingController: this.loadingController);
    this.scoreRepository.mockSubmitScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: this.scoreRepository.loadingController.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        if (!snapshot.data) {
          this.pageSliderRepository.nextPage();
        }

        return Center(
          child: LoadingItem(
            message: 'Calculating ...',
            isLoading: snapshot.data,
          ),
        );
      },
    );
  }
}
