import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:provider/provider.dart';

class QuizNavBarFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 8,
        left: 8,
        right: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              quizRepository.hideQuizFeature();
            },
            child: Container(
              child: Icon(
                Icons.close,
                color: gray,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
