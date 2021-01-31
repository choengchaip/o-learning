import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/mocks/quiz_data.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:o_learning/states/course_data_types.dart';
import 'package:o_learning/states/quiz_data_types.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/utils/object_helper.dart';

class QuizRepository extends BaseRepository {
  bool expandQuiz = false;
  bool _answerWrongAlert = false;
  bool _isInitial = false;
  bool _isAnswersInitial = false;
  String _currentQuestionId = '';
  String _currentChoiceId = '';
  String currentQuizId = '';
  int receivePoint = 0;

  QuizRepository() {
    if (!this._isInitial) {
      this.object.data['answers'] = List<Map<String, dynamic>>();
      this._isInitial = true;
    }
  }

  initialChoices() {
    if (!this._isAnswersInitial) {
      this.object.data['answer_ids'] = List.generate(
          this.currentQuestion.choices.length,
          (index) => {
                'label': '',
                'value': '',
              });
      this.object.data['choice_ids'] = List.generate(
          this.currentQuestion.choices.length,
          (index) => {
                'label': this.currentQuestion.choices[index].choiceText,
                'value': this.currentQuestion.choices[index].choiceId,
              });
      this._isAnswersInitial = true;
      notifyListeners();
    }
  }

  disposeChoices() {
    this.object.data['answer_ids'] = List();
    this.object.data['choice_ids'] = List();
    this._isAnswersInitial = false;
    notifyListeners();
  }

  bool isAnswerAdded(String choiceId) {
    return this.answerIds.singleWhere((answer) => answer['value'] == choiceId,
            orElse: () => null) !=
        null;
  }

  List get answerIds => this.object.data['answer_ids'];

  List get choiceIds => this.object.data['choice_ids'];

  void answerEssayQuestion(Map<String, dynamic> choiceId) {
    int index = (this.object.data['answer_ids'] as List)
        .indexWhere((answer) => answer['value'] == '');
    this.object.data['answer_ids'][index] = choiceId;
    this.notifyListeners();
  }

  IQuizItem get quizItem {
    List<IQuestionItem> items = List<IQuestionItem>();

    (this.object.data['${this.currentQuizId}_quiz_items'] as List)
        .forEach((raw) {
      items.add(IQuestionItem.fromJson(ObjectHelper.toMap(raw)));
    });

    return new IQuizItem(
        totalQuestion: items?.length ?? 0, questions: items ?? []);
  }

  bool get answerWrongAlert => this._answerWrongAlert;

  set answerWrongAlert(bool value) {
    this._answerWrongAlert = value;
  }

  String get currentQuestionId => this._currentQuestionId;

  set currentQuestionId(String value) {
    this._currentQuestionId = value;
  }

  String get currentChoiceId => this._currentChoiceId;

  set currentChoiceId(String value) {
    this._currentChoiceId = value;
    this.notifyListeners();
  }

  bool get canAnswer {
    if (this.currentQuestion == null) {
      return true;
    } else if (this.currentQuestion?.type == ChoiceType.ESSAY) {
      return this.answerIds.where((answer) => answer['value'] == '').isEmpty;
    } else if (this.currentQuestion?.type != ChoiceType.READING) {
      return this._currentChoiceId != '' ||
          this.currentQuestion?.type == ChoiceType.READING;
    } else {
      return true;
    }
  }

  List<dynamic> get answers => this.object.data['answers'];

  IQuestionItem get currentQuestion =>
      this.findQuestionById(this._currentQuestionId);

  Future<void> mockGetQuizDetail() async {
    this.toLoadingStatus();

    await Future.delayed(Duration(seconds: 1), () {
      this.toSuccessDataStatus(data: mockQuizItem);
    });

    this.toCompleteStatus();
  }

  Future<bool> getQuizDetail(String id, List<ISubModule> quizItems) async {
    this.toLoadingStatus();

    try {
      if (quizItems.isEmpty && id == '') {
        throw ('Quiz is empty');
      }
      String quizId = id;
      String quizKey = id;
      this.currentQuizId = id;
      if (id == '') {
        quizId = quizItems[0].id;
        quizKey = 'default';
        this.currentQuizId = 'default';

        for (int i = 0; i < quizItems.length; i++) {
          if (quizItems[i].current < quizItems[i].max) {
            quizId = quizItems[i].id;
            quizKey = quizItems[i].id;
            this.currentQuizId = quizItems[i].id;
            break;
          }
        }
      }

      http.Response data = await http.get(
          '${Config.baseURL}/submodule/title/$quizId',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['${quizKey}_quiz_items'] = jsonDecode(data.body);
    } catch (e) {
      this.toErrorStatus();
    }

    this.toCompleteStatus();
    return true;
  }

  IQuestionItem findQuestionById(String questionId) {
    try {
      return this
          .quizItem
          .questions
          .singleWhere((question) => question.id == questionId, orElse: null);
    } catch (e) {
      return null;
    }
  }

  void answerQuestion() {
    IQuestionItem questionItem = this.findQuestionById(this._currentQuestionId);
    bool isCorrect = false;

    if (questionItem != null) {
      switch (questionItem.type) {
        case ChoiceType.ESSAY:
          int index = 0;

          questionItem.correctChoiceIds.forEach((_, correct) {
            if (correct != this.answerIds[index]['value']) {
              answerWrongAlert = true;
              this.notifyListeners();
            }

            index++;
          });

          if (!this.answerWrongAlert) {
            isCorrect = true;
          }

          break;
        case ChoiceType.CHOICE:
          if (questionItem.correctChoiceId != this._currentChoiceId) {
            answerWrongAlert = true;
            this.notifyListeners();
          }
          break;
        default:
      }

      switch (questionItem.type) {
        case ChoiceType.READING:
          isCorrect = true;
          break;
        case ChoiceType.ESSAY:
          break;
        case ChoiceType.CHOICE:
          isCorrect = questionItem.correctChoiceId != this._currentChoiceId;
          break;
        default:
          isCorrect = false;
      }

      this.object.data['answers'] = [
        ...this.object.data['answers'],
        {
          'question_id': this._currentQuestionId,
          'type': this.currentQuestion.typeString,
          'choice_id': this._currentChoiceId,
          'score': questionItem?.score ?? 0,
          'is_correct': isCorrect,
        }
      ];
    }
  }

  void expandQuizFeature() {
    this.expandQuiz = true;
    this.notifyListeners();
  }

  void hideQuizFeature() {
    this.expandQuiz = false;
    this.notifyListeners();
  }

  void tryAgain() {
    (this.object.data['answers'] as List).removeLast();
    this.answerWrongAlert = false;
    this.notifyListeners();
  }

  void resetChoice() {
    this.object.data['answer_ids'] = List.generate(
        this.currentQuestion.choices.length,
        (index) => {
              'label': '',
              'value': '',
            });
    this.notifyListeners();
  }

  void resetAnswer() {
    this.object.data['answers'] = List<Map<String, dynamic>>();
    this.notifyListeners();
  }

  Future submitAnswer() async {
    this.toLoadingStatus();

    this.receivePoint = 0;
    List<Map<String, dynamic>> answers = List<Map<String, dynamic>>();
    (this.object.data['answers'] as List).forEach((raw) {
      answers.add(ObjectHelper.toMap(raw));
    });

    for (int i = 0; i < answers.length; i++) {
      DateTime now = DateTime.now();
      String dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss").format(now);
      try {
        await http.post('${Config.baseURL}/learning_progress/title',
            body: jsonEncode({
              "status": "1",
              "title_id": answers[i]['question_id'],
              "title_type": answers[i]['type'],
              "start_time": dateFormat,
              "finish_time": dateFormat,
              "star": 1,
            }),
            headers: {...ObjectHelper.getHeaderOption(this)});
        this.receivePoint++;
      } catch (e) {
        print('get category detail error $e');
        this.toErrorStatus();
      }
    }

    this.toCompleteStatus();
  }
}
