import 'package:flutter/cupertino.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/features/quiz/quiz_feature_item_choice.dart';
import 'package:o_learning/features/quiz/quiz_feature_item_essay.dart';
import 'package:o_learning/features/quiz/quiz_feature_item_reading.dart';
import 'package:o_learning/features/quiz/quiz_feature_item_text.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/states/quiz_data_types.dart';
import 'package:provider/provider.dart';

class QuizItemFeature extends StatelessWidget {
  final IQuestionItem questionItem;

  QuizItemFeature({
    @required this.questionItem,
  });

  Widget component() {
    switch (this.questionItem.type) {
      case ChoiceType.READING:
        return QuizItemReadingFeature(questionItem: this.questionItem);
      case ChoiceType.CHOICE:
        return QuizItemChoiceFeature(questionItem: this.questionItem);
      case ChoiceType.ESSAY:
        return QuizItemEssayFeature(questionItem: this.questionItem);
      case ChoiceType.TEXT:
        return QuizItemTextFeature(questionItem: this.questionItem);
      default:
        return QuizItemReadingFeature(questionItem: this.questionItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);
    quizRepository.currentQuestionId = this.questionItem.questionId;

    return Container(
      color: grayLighter.withOpacity(0.25),
      child: this.component(),
    );
  }
}
