import 'package:equatable/equatable.dart';
import 'package:fast_trivia/features/quiz/domain/entities/question.dart';

class Quiz extends Equatable {
  final int id;
  final String title;
  final int difficulty;
  final Map<int, Question> questions;
  final bool isCompleted;
  final int correctAnswers;

  const Quiz({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.questions,
    this.isCompleted = false,
    this.correctAnswers = 0,
  });

  Quiz copyWith({
    int? id,
    String? title,
    int? difficulty,
    Map<int, Question>? questions,
    bool? isCompleted,
    int? correctAnswers,
  }) {
    return Quiz(
      id: id ?? this.id,
      title: title ?? this.title,
      difficulty: difficulty ?? this.difficulty,
      questions: questions ?? this.questions,
      isCompleted: isCompleted ?? this.isCompleted,
      correctAnswers: correctAnswers ?? this.correctAnswers,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        difficulty,
        questions,
        isCompleted,
        correctAnswers,
      ];
}
