import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/states/quiz_data_types.dart';
import 'package:provider/provider.dart';

class QuizItemChoiceFeature extends StatelessWidget {
  final IQuestionItem questionItem;
  StreamController<String> answerController;

  QuizItemChoiceFeature({
    @required this.questionItem,
  }) {
    this.answerController = StreamController<String>();
  }

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

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
                color: secondaryColor,
                padding: EdgeInsets.all(16),
                child: Text(
                  this.questionItem.code,
                  style: TextStyle(
                    fontSize: fontSizeP,
                    color: Colors.white,
                  ),
                ),
              ),
        StreamBuilder<String>(
          stream: answerController.stream,
          builder: (context, snapshot) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: List.generate(this.questionItem.choices.length,
                    (int index) {
                  return GestureDetector(
                    onTap: () {
                      if (!quizRepository.answerWrongAlert) {
                        this
                            .answerController
                            .add(this.questionItem.choices[index].choiceId);
                        quizRepository.currentChoiceId =
                            this.questionItem.choices[index].choiceId;
                      }
                    },
                    child: Card(
                      shadowColor: snapshot.data ==
                              this.questionItem.choices[index].choiceId
                          ? Colors.transparent
                          : Colors.black,
                      margin: EdgeInsets.only(bottom: 12),
                      color: (snapshot.data ==
                                  this.questionItem.choices[index].choiceId &&
                              quizRepository.answerWrongAlert)
                          ? Theme.of(context).primaryColor
                          : snapshot.data ==
                                  this.questionItem.choices[index].choiceId
                              ? Theme.of(context).primaryColorLight
                              : Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 16,
                          right: 16,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          this.questionItem.choices[index].choiceText,
                          style: TextStyle(
                            color: (snapshot.data ==
                                        this
                                            .questionItem
                                            .choices[index]
                                            .choiceId &&
                                    quizRepository.answerWrongAlert)
                                ? Colors.white
                                : Colors.black,
                            fontSize: fontSizeP,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}
