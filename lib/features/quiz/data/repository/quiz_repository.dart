import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fast_trivia/features/quiz/data/adapter/quizes_adapter.dart';
import 'package:fast_trivia/features/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:fast_trivia/features/quiz/data/datasource/shared_preferences_data_source.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/domain/repository/quiz_repository.dart';
import 'package:fast_trivia/utils/failures.dart';

class QuizRepository implements IQuizRepository {
  final QuizRemoteDataSource dataSource;
  final SharedPreferencesDataSource prefsDataSource;

  const QuizRepository(
    this.dataSource,
    this.prefsDataSource,
  );
  @override
  Future<Either<Failure, Map<int, Quiz>>> getQuizes() async {
    try {
      final response = await dataSource.getQuizes();

      final quizes = QuizesAdapter.fromJson(response);

      return Right(quizes);
    } catch (e) {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, Map<int, Quiz>>> getQuizesHistory() async {
    try {
      final String stringQuiz = prefsDataSource.getQuizesHistory();
      late final Map<String, dynamic> stringJson;
      try {
        stringJson = jsonDecode(stringQuiz);
      } catch (e) {
        stringJson = {};
      }
      final quizes = QuizesAdapter.fromJson(stringJson);

      return Right(quizes);
    } catch (e) {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, void>> saveQuizesInHistory(
    Map<int, Quiz> quizes,
  ) async {
    try {
      final quizesString = QuizesAdapter.toJsonAsString(quizes);
      await prefsDataSource.saveQuizesInHistory(quizesString);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure(''));
    }
  }
}
