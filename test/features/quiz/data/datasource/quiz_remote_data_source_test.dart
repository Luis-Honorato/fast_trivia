import 'dart:convert';

import 'package:fast_trivia/features/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final QuizRemoteDataSource dataSource;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();

    dataSource = QuizRemoteDataSource();
  });
  test('Should return a json file when call getQuizes method', () async {
    final fakeQuizJson = await rootBundle.loadString(
        'lib/features/quiz/data/datasource/quiz_local_data_source.json');
    final expectedJson = jsonDecode(fakeQuizJson);

    final json = await dataSource.getQuizes();

    expect(json, equals(expectedJson));
  });
}
