import 'dart:convert';

import 'package:flutter/services.dart';

class QuizRemoteDataSource {
  Future<Map<String, dynamic>> getQuizes() async {
    final quizJson = await rootBundle.loadString(
        'lib/features/quiz/data/datasource/quiz_local_data_source.json');

    return jsonDecode(quizJson);
  }
}
