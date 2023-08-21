// Mocks generated by Mockito 5.4.2 from annotations
// in fast_trivia/test/features/quiz/domain/usecase/get_quizes_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart' as _i6;
import 'package:fast_trivia/features/quiz/domain/repository/quiz_repository.dart'
    as _i3;
import 'package:fast_trivia/utils/failures.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IQuizRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIQuizRepository extends _i1.Mock implements _i3.IQuizRepository {
  MockIQuizRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, Map<int, _i6.Quiz>>> getQuizes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getQuizes,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, Map<int, _i6.Quiz>>>.value(
                _FakeEither_0<_i5.Failure, Map<int, _i6.Quiz>>(
          this,
          Invocation.method(
            #getQuizes,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, Map<int, _i6.Quiz>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, Map<int, _i6.Quiz>>> getQuizesHistory() =>
      (super.noSuchMethod(
        Invocation.method(
          #getQuizesHistory,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, Map<int, _i6.Quiz>>>.value(
                _FakeEither_0<_i5.Failure, Map<int, _i6.Quiz>>(
          this,
          Invocation.method(
            #getQuizesHistory,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, Map<int, _i6.Quiz>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> saveQuizesInHistory(
          Map<int, _i6.Quiz>? quizes) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveQuizesInHistory,
          [quizes],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #saveQuizesInHistory,
            [quizes],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
