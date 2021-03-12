// @dart=2.9

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/states/quiz_data_types.dart';
import 'package:provider/provider.dart';

class QuizItemEssayFeature extends StatelessWidget {
  final IQuestionItem questionItem;

  QuizItemEssayFeature({
    @required this.questionItem,
  });

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      quizRepository.initialChoices();
    });

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        this.questionItem.imageUrl == null
            ? Container()
            : CachedNetworkImage(
                imageUrl: this.questionItem.imageUrl,
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
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Text(
            this.questionItem.question,
            style: TextStyle(
              fontSize: fontSizeP,
            ),
          ),
        ),
        this.questionItem.code == null
            ? Container()
            : Container(
                color: dark,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.questionItem.code,
                      style: TextStyle(
                        fontSize: fontSizeP,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 6,
                      ),
                      child: Row(
                        children: List.generate(
                            quizRepository.answerIds == null
                                ? 0
                                : quizRepository.answerIds.length, (index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 4,
                            ),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            padding: EdgeInsets.only(
                              top: 1,
                              bottom: 1,
                              left: 4,
                              right: 4,
                            ),
                            child: Text(
                              quizRepository.answerIds[index]['label'] ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSizeP,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
