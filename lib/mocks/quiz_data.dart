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
      'question':
          'อันนี้เป็นบทความให้อ่านก่อนทำข้อสอบ เช่น \nภาษาโปรแกรม Python คือภาษาโปรแกรมคอมพิวเตอร์ระดับสูง โดยถูกออกแบบมาให้เป็นภาษาสคริปต์ที่อ่านง่าย โดยตัดความซับซ้อนของโครงสร้างและไวยกรณ์ของภาษาออกไป ในส่วนของการแปลงชุดคำสั่งที่เราเขียนให้เป็นภาษาเครื่อง Python มีการทำงานแบบ Interpreter คือเป็นการแปลชุดคำสั่งทีละบรรทัด เพื่อป้อนเข้าสู่หน่วยประมวลผลให้คอมพิวเตอร์ทำงาน',
    },
    {
      'question_id': 'question_02',
      'type_string': 'choice',
      'question':
          'โจทย์แบบเลือกตอบ โดยการคลิกจาก ตัวเลือกที่มีให้ เช่น \nหากต้องการแปลงชนิดข้อมูลตัวแปร a ที่เป็นชนิด Integer ให้เป็น String จะต้องใช้คำสั่งใด',
      'choices': [
        {'choice_id': 'choice_01', 'choice_text': 'int(a)'},
        {'choice_id': 'choice_02', 'choice_text': 'IntToString(a)'},
        {'choice_id': 'choice_03', 'choice_text': 'str(a)'},
        {'choice_id': 'choice_04', 'choice_text': 'string(a)'},
      ],
      'correct_answer_id': 'choice_03',
      'answer_wrong_message': 'ข้อความแสดง เมื่อผู้ใช้ตอบผิด!',
      'score': 30,
    },
    {
      'question_id': 'question_03',
      'type_string': 'essay',
      'question':
          'โจทย์แบบเติมคำในช่องว่าง โดยมีตัวเลือกให้ เช่น\nถ้าต้องการสร้างตัวแปรชื่อ job โดยมีค่าเท่ากับ "Plumber"\nจงเติมคำในช่องว่าง',
      'choices': [
        {'choice_id': 'choice_01', 'choice_text': '='},
        {'choice_id': 'choice_02', 'choice_text': '"Plumber"'},
        {'choice_id': 'choice_03', 'choice_text': 'job'},
      ],
      'code': 'name = "Singh"',
      'correct_answer_id': 'choice_02',
      'correct_answer_ids': {
        'answer_01': 'choice_03',
        'answer_02': 'choice_01',
        'answer_03': 'choice_02',
      },
      'answer_wrong_message': 'You are wrong!2',
      'score': 60,
    },
    // {
    //   'question_id': 'question_04',
    //   'type_string': 'text',
    //   'question':
    //   'โจทย์ข้อเขียน คล้ายกับแบบเติมคำ แต่จะให้ผู้เรียนพิมเอง เช่น\nทำให้ตัวแปร user_agent เก็บ "Desktop"',
    //   'code': 'name = "Singh"',
    //   'correct_answer_id': 'choice_02',
    //   'correct_answer_ids': {
    //     'answer_01': 'choice_03',
    //     'answer_02': 'choice_01',
    //     'answer_03': 'choice_02',
    //   },
    //   'correct_text': 'Desktop',
    //   'answer_wrong_message': 'You are wrong!2',
    //   'score': 60,
    // }
  ]
};
