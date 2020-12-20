import 'dart:async';
import 'package:o_learning/repository/quiz_repository.dart';

class ScoreRepository {
  QuizRepository quizRepository;
  StreamController loadingController;

  Future<void> mockSubmitScore() async {
    this.loadingController.add(true);

    await Future.delayed(Duration(seconds: 2), () {});

    this.loadingController.add(false);
  }

  initial({
    QuizRepository quizRepository,
    StreamController loadingController,
  }) {
    if (quizRepository != null) {
      this.quizRepository = quizRepository;
    }
    if (loadingController != null) {
      this.loadingController = loadingController;
    }
  }
}
