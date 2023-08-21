import 'package:dartz/dartz.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/domain/repository/quiz_repository.dart';
import 'package:fast_trivia/utils/failures.dart';

class SaveQuizesInHistoryUsecase {
  final IQuizRepository repository;

  const SaveQuizesInHistoryUsecase(this.repository);

  Future<Either<Failure, void>> call(Map<int, Quiz> quizes) async {
    return await repository.saveQuizesInHistory(quizes);
  }
}
