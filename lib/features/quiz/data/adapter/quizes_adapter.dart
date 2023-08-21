import 'dart:convert';

import 'package:fast_trivia/features/quiz/data/adapter/questions_adapter.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';

class QuizesAdapter {
  const QuizesAdapter._();

  /// Method to Adapte a json received and return a List of Quiz
  static Map<int, Quiz> fromJson(Map<String, dynamic> json) {
    final List quizesKey = json["questionarios"] ?? [];
    final Map<int, Quiz> quizes = {};
    for (dynamic quiz in quizesKey) {
      quizes[quiz['id']] = Quiz(
          id: quiz['id'],
          title: quiz['titulo'],
          difficulty: quiz['dificuldade'],
          questions: QuestionsAdapter.fromJson(
            (quiz['questoes']).cast<Map<String, dynamic>>(),
          ),
          correctAnswers: quiz['acertos'] ?? 0,
          isCompleted: quiz['quiz_completo'] ?? false);
    }

    return quizes;
  }

  /// Method to Adapte a ```Map<int, Quiz>``` received and returns a
  /// ```String``` adapted to save in SharedPreferences data base.
  ///
  /// Is used to Adaptate the Questions of the Quiz to a Json.
  static String toJsonAsString(Map<int, Quiz> quizesMap) {
    final List<Map<String, dynamic>> quizesList = [];
    for (Quiz quiz in quizesMap.values) {
      quizesList.add({
        "id": quiz.id,
        "titulo": quiz.title,
        "dificuldade": quiz.difficulty,
        "questoes": QuestionsAdapter.toJson(quiz.questions),
        "acertos": quiz.correctAnswers,
        "quiz_completo": quiz.isCompleted,
      });
    }

    final Map<String, dynamic> quizesJson = {"questionarios": quizesList};
    final quizesString = jsonEncode(quizesJson);

    return quizesString;
  }
}
