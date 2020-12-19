import 'package:flutter/cupertino.dart';

class IQuizItem {
  final String quizId;
  final int totalQuestion;
  final int maxScore;
  List<IQuestionItem> questions;

  IQuizItem({
    @required this.quizId,
    @required this.totalQuestion,
    @required this.maxScore,
    @required this.questions,
  });

  factory IQuizItem.fromJson(Map<String, dynamic> rawJson) {
    return IQuizItem(
      quizId: rawJson['quiz_id'],
      totalQuestion: rawJson['total_question'],
      maxScore: rawJson['max_score'],
      questions: IQuestionItem.fromListJson(rawJson['questions']),
    );
  }
}

enum ChoiceType {
  READING,
  CHOICE,
  ESSAY,
  TEXT,
}

class IChoiceItem {
  final String choiceId;
  final String choiceText;

  IChoiceItem({
    @required this.choiceId,
    @required this.choiceText,
  });

  static List<IChoiceItem> fromListJson(
      List<Map<String, dynamic>> listRawJson) {
    if (listRawJson == null) {
      return <IChoiceItem>[].toList();
    }

    return listRawJson.map((rawJson) {
      return IChoiceItem.fromJson(rawJson);
    }).toList();
  }

  factory IChoiceItem.fromJson(Map<String, dynamic> rawJson) {
    return IChoiceItem(
      choiceId: rawJson['choice_id'],
      choiceText: rawJson['choice_text'],
    );
  }
}

class IQuestionItem {
  final String questionId;
  final String imageUrl;
  final String typeString;
  final String question;
  final String note;
  final String code;
  final List<IChoiceItem> choices;
  final String correctChoiceId;
  final Map<String, String> correctChoiceIds;
  final String answerWrongMessage;
  final int score;

  IQuestionItem({
    @required this.questionId,
    @required this.typeString,
    @required this.question,
    this.imageUrl,
    this.note,
    this.code,
    this.choices,
    this.correctChoiceId,
    this.correctChoiceIds,
    this.answerWrongMessage,
    this.score,
  });

  ChoiceType get type {
    switch (this.typeString) {
      case 'reading':
        return ChoiceType.READING;
      case 'choice':
        return ChoiceType.CHOICE;
      case 'essay':
        return ChoiceType.ESSAY;
      case 'text':
        return ChoiceType.TEXT;
      default:
        return ChoiceType.READING;
    }
  }

  static List<IQuestionItem> fromListJson(
      List<Map<String, dynamic>> listRawJson) {
    if (listRawJson == null) {
      return <IQuestionItem>[].toList();
    }

    return listRawJson.map((rawJson) {
      return IQuestionItem.fromJson(rawJson);
    }).toList();
  }

  factory IQuestionItem.fromJson(Map<String, dynamic> rawJson) {
    return IQuestionItem(
      questionId: rawJson['question_id'],
      imageUrl: rawJson['image_url'],
      typeString: rawJson['type_string'],
      question: rawJson['question'],
      note: rawJson['note'],
      code: rawJson['code'],
      choices: IChoiceItem.fromListJson(rawJson['choices']),
      correctChoiceId: rawJson['correct_answer_id'],
      correctChoiceIds: rawJson['correct_answer_ids'],
      answerWrongMessage: rawJson['answer_wrong_message'],
      score: rawJson['score'],
    );
  }
}
