import 'package:fast_trivia/features/quiz/data/adapter/alternatives_adapter.dart';
import 'package:fast_trivia/features/quiz/domain/entities/question.dart';

class QuestionsAdapter {
  const QuestionsAdapter._();

  /// Method to Adapte a json received and return a Map of String, Question
  static Map<int, Question> fromJson(List<Map<String, dynamic>> json) {
    final Map<int, Question> questions = {};
    for (dynamic question in json) {
      questions[question['id']] = Question(
          id: question['id'],
          title: question['titulo'],
          question: question['pergunta'],
          answer: question['gabarito'],
          alternatives: AlternativesAdapter.fromJson(
            (question['alternativas'] as List).cast<Map<String, dynamic>>(),
          ),
          isAnsweredCorrectly: question['respondida_corretamente'] ?? false,
          userAnswer: question['resposta_do_usuario']);
    }

    return questions;
  }

  /// Method to Adapte a ```Map<int, Questions>``` received and returns a
  /// ```List<Map<String, dynamic>>```.
  ///
  /// Is used to Adaptate the Questions of the Quiz to a Json.
  static List<Map<String, dynamic>> toJson(Map<int, Question> questionsMap) {
    final List<Map<String, dynamic>> questionsList = [];
    for (Question question in questionsMap.values) {
      questionsList.add({
        "id": question.id,
        "titulo": question.title,
        "pergunta": question.question,
        "gabarito": question.answer,
        "alternativas": AlternativesAdapter.toJson(question.alternatives),
        "respondida_corretamente": question.isAnsweredCorrectly,
        if (question.userAnswer != null)
          "resposta_do_usuario": question.userAnswer,
      });
    }

    return questionsList;
  }
}
