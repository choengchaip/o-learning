import 'package:flutter/cupertino.dart';
import 'package:o_learning/states/quiz_data_types.dart';

class QuizItemReadingFeature extends StatelessWidget {
  final IQuestionItem questionItem;

  QuizItemReadingFeature({
    @required this.questionItem,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(this.questionItem.question),
      ),
    );
  }
}
