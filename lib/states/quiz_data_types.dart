import 'package:flutter/cupertino.dart';
import 'package:o_learning/utils/object_helper.dart';

class IQuizItem {
  final int totalQuestion;
  List<IQuestionItem> questions;

  IQuizItem({
    @required this.totalQuestion,
    @required this.questions,
  });

  factory IQuizItem.fromJson(Map<String, dynamic> rawJson) {
    return IQuizItem(
      totalQuestion: rawJson['total_question'] ?? 1,
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

  static List<IChoiceItem> fromListJson(List<dynamic> listRawJson) {
    if (listRawJson == null) {
      return <IChoiceItem>[].toList();
    }

    List<String> rawChoices =
        (ObjectHelper.toMap(listRawJson[0])['choice'] as String)
            .replaceAll('&quot;', '')
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll(new RegExp(r'\s+'), '')
            .split(',');
    List<IChoiceItem> choices = List<IChoiceItem>();

    for (int i = 0; i < rawChoices.length; i++) {
      choices
          .add(IChoiceItem(choiceId: i.toString(), choiceText: rawChoices[i]));
    }

    return choices;
  }

  factory IChoiceItem.fromJson(Map<String, dynamic> rawJson) {
    return IChoiceItem(
      choiceId: rawJson['choice_id'],
      choiceText: rawJson['choice_text'],
    );
  }
}

class IQuestionItem {
  final String id;
  final String title;
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
    @required this.id,
    @required this.title,
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
      case 'CONTENT':
        return ChoiceType.READING;
      case 'QUIZ':
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

  static String getAnswerChoice(List<dynamic> rawJson) {
    if (rawJson == null) {
      return '';
    }

    try {
      return ObjectHelper.toMap(rawJson[0])['answer'];
    } catch (e) {
      print('set answer error $e');
      return '';
    }
  }

  factory IQuestionItem.fromJson(Map<String, dynamic> rawJson) {
    return IQuestionItem(
      id: rawJson['title_id'],
      title: rawJson['title_name'],
      imageUrl: rawJson['image_url'],
      typeString: rawJson['title_type'],
      question: rawJson['title_description'],
      note: rawJson['note'] ?? '',
      code: rawJson['code'],
      choices: IChoiceItem.fromListJson(rawJson['choice']),
      correctChoiceId: IQuestionItem.getAnswerChoice(rawJson['choice']),
      correctChoiceIds: rawJson['correct_answer_ids'],
      answerWrongMessage: rawJson['answer_wrong_message'],
      score: rawJson['score'],
    );
  }
}
