import 'dart:convert';

import 'package:fast_trivia/features/quiz/data/adapter/quizes_adapter.dart';
import 'package:fast_trivia/features/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:fast_trivia/features/quiz/data/datasource/shared_preferences_data_source.dart';
import 'package:fast_trivia/features/quiz/data/repository/quiz_repository.dart';
import 'package:fast_trivia/features/quiz/domain/entities/question.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'quiz_repository_test.mocks.dart';

@GenerateMocks([
  QuizRemoteDataSource,
  SharedPreferencesDataSource,
])
void main() {
  late final MockQuizRemoteDataSource mockDataSource;
  late final MockSharedPreferencesDataSource mockPrefsDataSource;
  late final QuizRepository repository;

  setUpAll(() {
    mockDataSource = MockQuizRemoteDataSource();
    mockPrefsDataSource = MockSharedPreferencesDataSource();
    repository = QuizRepository(
      mockDataSource,
      mockPrefsDataSource,
    );
  });

  const fakeQuizJson = '''{
      "questionarios": [
        {
          "id": 1,
          "titulo": "title1",
          "dificuldade": 1,
          "questoes": [
            {
              "id": 1,
              "titulo": "title1",
              "pergunta": "teste1",
              "gabarito": 1,
              "alternativas": []
            }
          ]
        }
      ]
    }''';

  const expectedQuiz = Quiz(
    id: 1,
    title: 'title1',
    difficulty: 1,
    questions: {
      1: Question(
        id: 1,
        title: 'title1',
        question: 'teste1',
        answer: 1,
        alternatives: [],
      ),
    },
  );

  const Map<int, Quiz> quizesMap = {
    1: Quiz(
      id: 1,
      title: 'title1',
      difficulty: 1,
      questions: {
        1: Question(
          id: 1,
          title: 'title1',
          question: 'teste1',
          answer: 1,
          alternatives: [],
        ),
      },
    ),
    2: Quiz(
      id: 2,
      title: 'teste2',
      difficulty: 2,
      questions: {
        1: Question(
          id: 1,
          title: 'title1',
          question: 'teste1',
          answer: 1,
          alternatives: [],
        ),
      },
    ),
  };

  test('Should return a Map of Quizes when call getQuizes method', () async {
    when(mockDataSource.getQuizes()).thenAnswer(
      (realInvocation) async => jsonDecode(fakeQuizJson),
    );
    final responseQuizes = await repository.getQuizes();
    final quizes = responseQuizes.fold(
      (failure) {},
      (quizes) => quizes,
    );
    expect(quizes![1], equals(expectedQuiz));
  });

  test(
    'Should return a Map of Quizes when calls getQuizesHistory method',
    () async {
      final quizesString = QuizesAdapter.toJsonAsString(quizesMap);
      when(mockPrefsDataSource.getQuizesHistory()).thenAnswer(
        (realInvocation) => quizesString,
      );
      final responseQuizes = await repository.getQuizesHistory();
      final quizes = responseQuizes.fold(
        (failure) {},
        (quizes) => quizes,
      );
      expect(quizes![1], equals(expectedQuiz));
    },
  );

  test('Should return null when calls saveQuizesInHistory method', () async {
    when(mockPrefsDataSource.saveQuizesInHistory(any))
        .thenAnswer((realInvocation) async {});

    final response = await repository.saveQuizesInHistory(quizesMap);

    final nullResponse = response.fold(
      (l) => null,
      (r) => null,
    );

    expect(nullResponse, equals(null));
  });
}
