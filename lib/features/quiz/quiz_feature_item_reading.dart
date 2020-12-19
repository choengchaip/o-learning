import 'package:flutter/cupertino.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/states/quiz_data_types.dart';
import 'package:transparent_image/transparent_image.dart';

class QuizItemReadingFeature extends StatelessWidget {
  final IQuestionItem questionItem;

  QuizItemReadingFeature({
    @required this.questionItem,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.width / ration169),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: this.questionItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
                this.questionItem.question,
              style: TextStyle(
                fontSize: fontSizeP,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
