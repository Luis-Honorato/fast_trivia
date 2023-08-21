import 'package:dartz/dartz.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/utils/failures.dart';

abstract class IQuizRepository {
  Future<Either<Failure, Map<int, Quiz>>> getQuizes();
  Future<Either<Failure, Map<int, Quiz>>> getQuizesHistory();
  Future<Either<Failure, void>> saveQuizesInHistory(Map<int, Quiz> quizes);
}
