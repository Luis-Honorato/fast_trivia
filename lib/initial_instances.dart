import 'package:fast_trivia/features/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:fast_trivia/features/quiz/data/datasource/shared_preferences_data_source.dart';
import 'package:fast_trivia/features/quiz/data/repository/quiz_repository.dart';
import 'package:fast_trivia/features/quiz/domain/usecase/get_quizes_history_usecase.dart';
import 'package:fast_trivia/features/quiz/domain/usecase/get_quizes_usecase.dart';
import 'package:fast_trivia/features/quiz/domain/usecase/save_quizes_in_history_usecase.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';

final _quizRepository = QuizRepository(
  QuizRemoteDataSource(),
  SharedPreferencesDataSource(),
);

final quizBloc = QuizBloc(
  getQuizesUsecase: GetQuizesUsecase(_quizRepository),
  getQuizesHistoryUsecase: GetQuizesHistoryUsecase(_quizRepository),
  saveQuizesInHistoryUsecase: SaveQuizesInHistoryUsecase(_quizRepository),
);
