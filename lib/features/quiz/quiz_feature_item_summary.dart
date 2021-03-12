// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:provider/provider.dart';

class QuizItemSummaryFeature extends StatelessWidget {
  final Function onClick;

  QuizItemSummaryFeature({
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Score summary feature'),
            ),
          ),
          Container(

          ),
          CurveButton(
            title: 'OK',
            onPressed: this.onClick,
          ),
        ],
      ),
    );
  }
}
