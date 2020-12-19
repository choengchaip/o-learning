import 'package:flutter/cupertino.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/states/quiz_data_types.dart';

class QuizItemSummaryFeature extends StatelessWidget {
  final Function onClick;

  QuizItemSummaryFeature({
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Score summary feature'),
            ),
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
