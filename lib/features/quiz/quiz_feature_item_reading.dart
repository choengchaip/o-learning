import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/states/quiz_data_types.dart';

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
          CachedNetworkImage(
            height: 200,
            imageUrl: this.questionItem.imageUrl ?? '',
            imageBuilder: (context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.width / ration169),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
                this.questionItem.question ?? '',
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
