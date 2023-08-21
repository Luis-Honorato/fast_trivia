import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_trivia/features/quiz/domain/entities/question.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/domain/usecase/get_quizes_history_usecase.dart';
import 'package:fast_trivia/features/quiz/domain/usecase/get_quizes_usecase.dart';
import 'package:fast_trivia/features/quiz/domain/usecase/save_quizes_in_history_usecase.dart';
import 'package:fast_trivia/utils/request_status.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuizesUsecase getQuizesUsecase;
  final GetQuizesHistoryUsecase getQuizesHistoryUsecase;
  final SaveQuizesInHistoryUsecase saveQuizesInHistoryUsecase;
  QuizBloc({
    required this.getQuizesUsecase,
    required this.getQuizesHistoryUsecase,
    required this.saveQuizesInHistoryUsecase,
  }) : super(QuizState()) {
    on<FetchQuizesEvent>((event, emit) async {
      emit(state.copyWith(
        quizesStatus: RequestStatus.loading,
      ));

      final result = await getQuizesUsecase();

      result.fold((failure) {
        emit(state.copyWith(
          quizesStatus: RequestStatus.failure,
        ));
      }, (quizes) {
        emit(state.copyWith(
          quizesStatus: RequestStatus.success,
          quizes: quizes,
        ));
      });
    });

    on<SetCurrentQuizEvent>((event, emit) {
      emit(state.copyWith(
        currentQuiz: event.quiz,
      ));
    });

    on<AnswerQuestionEvent>((event, emit) {
      final question = event.question;

      final bool isAnsweredCorrectly = event.alternativeID == question.answer;

      final newQuestions = {...state.currentQuiz!.questions};

      newQuestions[question.id] = question.copyWith(
        userAnswer: event.alternativeID,
        isAnsweredCorrectly: isAnsweredCorrectly,
      );

      final currentQuiz = state.currentQuiz!.copyWith(questions: newQuestions);

      emit(state.copyWith(currentQuiz: currentQuiz));
    });

    on<SendQuizEvent>((event, emit) async {
      emit(state.copyWith(
        currentQuiz: state.currentQuiz!.copyWith(
          isCompleted: true,
          correctAnswers: event.correctAnswers,
        ),
      ));
      final currentQuiz = state.currentQuiz!;
      final newQuizes = {...state.quizes};

      newQuizes[currentQuiz.id] = currentQuiz;

      emit(state.copyWith(
        quizes: newQuizes,
      ));

      final newHistoryQuizes = {...state.historyQuizes};
      newHistoryQuizes[newHistoryQuizes.length + 1] = currentQuiz;

      final saveQuizResult = await saveQuizesInHistoryUsecase(newHistoryQuizes);

      saveQuizResult.fold(
        (failure) => emit(state.copyWith(
          saveQuizStatus: RequestStatus.failure,
        )),
        (success) => emit(state.copyWith(
          saveQuizStatus: RequestStatus.success,
          historyQuizes: newHistoryQuizes,
        )),
      );
    });

    on<FetchHistoryQuizesEvent>((event, emit) async {
      emit(state.copyWith(
        fetchHistoryQuizesStatus: RequestStatus.loading,
      ));

      final result = await getQuizesHistoryUsecase();

      result.fold((failure) {
        emit(state.copyWith(
          fetchHistoryQuizesStatus: RequestStatus.failure,
        ));
      }, (historyQuizes) {
        emit(state.copyWith(
          fetchHistoryQuizesStatus: RequestStatus.success,
          historyQuizes: historyQuizes,
        ));
      });
    });

    on<EreaseHistoryEvent>((event, emit) async {
      final saveQuizResult = await saveQuizesInHistoryUsecase({});

      saveQuizResult.fold(
        (failure) => emit(state.copyWith(
          saveQuizStatus: RequestStatus.failure,
        )),
        (success) => emit(state.copyWith(
          saveQuizStatus: RequestStatus.success,
          historyQuizes: {},
        )),
      );
    });
  }
}
