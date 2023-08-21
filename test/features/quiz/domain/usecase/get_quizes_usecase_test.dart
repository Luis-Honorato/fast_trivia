import 'package:dartz/dartz.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/domain/repository/quiz_repository.dart';
import 'package:fast_trivia/features/quiz/domain/usecase/get_quizes_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_quizes_usecase_test.mocks.dart';

@GenerateMocks([IQuizRepository])
void main() {
  late final MockIQuizRepository mockRepository;
  late final GetQuizesUsecase getQuizesUsecase;

  setUp(() {
    mockRepository = MockIQuizRepository();
    getQuizesUsecase = GetQuizesUsecase(mockRepository);
  });
  test('Should return a Map of Quizes when call usecase', () async {
    const quizesReponse = {
      1: Quiz(
        id: 1,
        title: 'teste1',
        difficulty: 1,
        questions: {},
      ),
      2: Quiz(
        id: 2,
        title: 'teste2',
        difficulty: 2,
        questions: {},
      ),
    };
    when(mockRepository.getQuizes())
        .thenAnswer((realInvocation) async => const Right(quizesReponse));
    final response = await getQuizesUsecase();

    expect(response, equals(const Right(quizesReponse)));
  });
}
