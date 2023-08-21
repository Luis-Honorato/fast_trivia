import 'package:dartz/dartz.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/domain/repository/quiz_repository.dart';
import 'package:fast_trivia/utils/failures.dart';

class GetQuizesHistoryUsecase {
  final IQuizRepository repository;

  const GetQuizesHistoryUsecase(this.repository);

  Future<Either<Failure, Map<int, Quiz>>> call() async {
    return await repository.getQuizesHistory();
  }
}
