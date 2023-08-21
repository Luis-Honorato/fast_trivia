part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

/// Event to initialize app and fetch all quizes, and display to user in QuizesPage
class FetchQuizesEvent extends QuizEvent {}

/// Event fetch all history quizes, and display to user in HistoryPage
class FetchHistoryQuizesEvent extends QuizEvent {}

/// Event emited when user click on a quiz, will be used to reply questions
class SetCurrentQuizEvent extends QuizEvent {
  final Quiz quiz;

  const SetCurrentQuizEvent(this.quiz);
}

/// Event to answer a question, is need alternativeID and questionID to verify
/// if user answer correctly
class AnswerQuestionEvent extends QuizEvent {
  final int alternativeID;
  final Question question;

  const AnswerQuestionEvent({
    required this.alternativeID,
    required this.question,
  });
}

/// Event to finalize quiz and see the score and the correctly responses
class SendQuizEvent extends QuizEvent {
  final int correctAnswers;

  const SendQuizEvent({required this.correctAnswers});
}

/// Event to exclude all historyQuizes
class EreaseHistoryEvent extends QuizEvent {}
