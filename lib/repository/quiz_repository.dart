import 'package:o_learning/repository/base_repository.dart';

class QuizRepository extends BaseRepository {
  bool expandQuiz = false;

  void expandQuizFeature() {
    this.expandQuiz = true;
    notifyListeners();
  }

  void hideQuizFeature() {
    this.expandQuiz = false;
    notifyListeners();
  }
}
