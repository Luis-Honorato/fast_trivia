import 'package:fast_trivia/features/quiz/data/adapter/questions_adapter.dart';
import 'package:fast_trivia/features/quiz/domain/entities/alternative.dart';
import 'package:fast_trivia/features/quiz/domain/entities/question.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const fakeAlternativesList = [
    Alternative(
      id: 1,
      title: 'title1',
    ),
    Alternative(
      id: 2,
      title: 'title2',
    ),
    Alternative(
      id: 3,
      title: 'title3',
    ),
    Alternative(
      id: 4,
      title: 'title4',
    ),
  ];

  final List<Map<String, dynamic>> fakeQuestionsJson = [
    {
      "id": 1,
      "titulo": "title1",
      "pergunta": "pergunta1?",
      "gabarito": 1,
      "alternativas": [
        {"id": 1, "titulo": "title1"},
        {"id": 2, "titulo": "title2"},
        {"id": 3, "titulo": "title3"},
        {"id": 4, "titulo": "title4"}
      ],
      "respondida_corretamente": false
    },
    {
      "id": 2,
      "titulo": "title2",
      "pergunta": "pergunta2?",
      "gabarito": 2,
      "alternativas": [
        {"id": 1, "titulo": "title1"},
        {"id": 2, "titulo": "title2"},
        {"id": 3, "titulo": "title3"},
        {"id": 4, "titulo": "title4"}
      ],
      "respondida_corretamente": false
    }
  ];

  const questionsList = [
    Question(
      id: 1,
      title: 'title1',
      question: 'pergunta1?',
      answer: 1,
      alternatives: fakeAlternativesList,
    ),
    Question(
      id: 2,
      title: 'title2',
      question: 'pergunta2?',
      answer: 2,
      alternatives: fakeAlternativesList,
    ),
  ];

  test('Should return a list of Questions when calls fromJson method', () {
    final questions = QuestionsAdapter.fromJson(fakeQuestionsJson);

    expect(questions[1], equals(questionsList[0]));
  });

  final fakeQuestionsMap = {
    1: questionsList[0],
    2: questionsList[1],
  };

  test(
    'Should return a List of Map<String, dynamic> when calls toJson method',
    () {
      final questionsJson = QuestionsAdapter.toJson(fakeQuestionsMap);

      expect(questionsJson[0], equals(fakeQuestionsJson[0]));
    },
  );
}
