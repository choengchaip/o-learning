import 'dart:async';
import 'package:o_learning/mocks/quiz_data.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:o_learning/states/quiz_data_types.dart';

class QuizRepository extends BaseRepository {
  bool expandQuiz = false;

  IQuizItem get findItem => IQuizItem.fromJson(this.object.data);

  Future<void> mockGetQuizDetail() async {
    this.toLoadingStatus();

    await Future.delayed(Duration(seconds: 1), () {
      this.toSuccessDataStatus(data: mockQuizItem);
    });

    this.toCompleteStatus();
  }

  void expandQuizFeature() {
    this.expandQuiz = true;
    notifyListeners();
  }

  void hideQuizFeature() {
    this.expandQuiz = false;
    notifyListeners();
  }
}
