import 'dart:convert';

import 'package:fast_trivia/features/quiz/data/adapter/quizes_adapter.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  const quizesList = [
    Quiz(
      id: 1,
      title: 'title1',
      difficulty: 1,
      questions: {},
    ),
    Quiz(
      id: 2,
      title: 'title2',
      difficulty: 2,
      questions: {},
    ),
  ];
  test('Should Return a Quiz when call Adapter', () async {
    const fakeQuizJson = '''{
      "questionarios": [
        {
          "id": 1,
          "titulo": "title1",
          "dificuldade": 1,
          "questoes": [],
          "acertos": 0,
          "quiz_completo": false
        }
      ]
    }''';

    final quizes = QuizesAdapter.fromJson(json.decode(fakeQuizJson));

    expect(quizes[1], equals(quizesList[0]));
  });

  final Map<int, Quiz> quizesMap = {
    1: quizesList[0],
    2: quizesList[1],
  };
  test('Should return a String adapted to json when calls toJson method', () {
    const expectedQuizesString =
        '''{"questionarios":[{"id":1,"titulo":"title1","dificuldade":1,"questoes":[],"acertos":0,"quiz_completo":false},{"id":2,"titulo":"title2","dificuldade":2,"questoes":[],"acertos":0,"quiz_completo":false}]}''';
    final quizesString = QuizesAdapter.toJsonAsString(quizesMap);

    expect(quizesString, equals(expectedQuizesString));
  });
}
