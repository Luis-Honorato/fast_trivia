part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final RequestStatus quizesStatus;
  final RequestStatus saveQuizStatus;
  final RequestStatus fetchHistoryQuizesStatus;
  final Map<int, Quiz> quizes;
  final Map<int, Quiz> historyQuizes;
  final Quiz? currentQuiz;
  const QuizState({
    this.quizesStatus = RequestStatus.initial,
    this.saveQuizStatus = RequestStatus.initial,
    this.fetchHistoryQuizesStatus = RequestStatus.initial,
    this.quizes = const {},
    this.historyQuizes = const {},
    this.currentQuiz,
  });

  QuizState copyWith({
    RequestStatus? quizesStatus,
    RequestStatus? saveQuizStatus,
    RequestStatus? fetchHistoryQuizesStatus,
    Map<int, Quiz>? quizes,
    Map<int, Quiz>? historyQuizes,
    Quiz? currentQuiz,
  }) {
    return QuizState(
      quizesStatus: quizesStatus ?? this.quizesStatus,
      saveQuizStatus: saveQuizStatus ?? this.saveQuizStatus,
      fetchHistoryQuizesStatus:
          fetchHistoryQuizesStatus ?? this.fetchHistoryQuizesStatus,
      quizes: quizes ?? this.quizes,
      historyQuizes: historyQuizes ?? this.historyQuizes,
      currentQuiz: currentQuiz ?? this.currentQuiz,
    );
  }

  @override
  List<Object?> get props => [
        quizesStatus,
        saveQuizStatus,
        fetchHistoryQuizesStatus,
        quizes,
        historyQuizes,
        currentQuiz,
      ];
}
