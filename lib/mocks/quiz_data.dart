Map<String, dynamic> mockQuizItem = {
  'quiz_id': 'quiz_01',
  'total_question': 3,
  'max_score': 90,
  'questions': [
    {
      'question_id': 'question_01',
      'image_url':
          'https://benzneststudios.com/blog/wp-content/uploads/2019/03/cover2-768x391.png',
      'type_string': 'reading',
      'question': 'Questionnnnn',
    },
    {
      'question_id': 'question_02',
      'type_string': 'choice',
      'question': 'Select answer1',
      'choices': [
        {'choice_id': 'choice_01', 'choice_text': 'singh'},
        {'choice_id': 'choice_02', 'choice_text': 'siddx12'}
      ],
      'correct_answer_id': 'choice_01',
      'answer_wrong_message': 'You are wrong!',
      'score': 30,
    },
    {
      'question_id': 'question_03',
      'type_string': 'choice',
      'question': 'Select answer2',
      'choices': [
        {'choice_id': 'choice_01', 'choice_text': 'hello world'},
        {'choice_id': 'choice_02', 'choice_text': 'asdasd'}
      ],
      'correct_answer_id': 'choice_02',
      'answer_wrong_message': 'You are wrong!2',
      'score': 60,
    }
  ]
};
