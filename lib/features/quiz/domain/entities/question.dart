import 'package:equatable/equatable.dart';

import 'package:fast_trivia/features/quiz/domain/entities/alternative.dart';

class Question extends Equatable {
  final int id;
  final String title;
  final String question;
  final int answer;
  final List<Alternative> alternatives;
  final int? userAnswer;
  final bool isAnsweredCorrectly;

  const Question({
    required this.id,
    required this.title,
    required this.question,
    required this.answer,
    required this.alternatives,
    this.userAnswer,
    this.isAnsweredCorrectly = false,
  }) : assert(!isAnsweredCorrectly ||
            (isAnsweredCorrectly && answer == userAnswer));

  Question copyWith({
    int? id,
    String? title,
    String? question,
    int? answer,
    List<Alternative>? alternatives,
    int? userAnswer,
    bool? isAnsweredCorrectly,
  }) {
    return Question(
      id: id ?? this.id,
      title: title ?? this.title,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      alternatives: alternatives ?? this.alternatives,
      userAnswer: userAnswer ?? this.userAnswer,
      isAnsweredCorrectly: isAnsweredCorrectly ?? this.isAnsweredCorrectly,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        question,
        answer,
        alternatives,
        userAnswer,
        isAnsweredCorrectly,
      ];
}
