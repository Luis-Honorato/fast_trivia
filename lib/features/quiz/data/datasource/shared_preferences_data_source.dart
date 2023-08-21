import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSource {
  static late SharedPreferences _prefs;
  static const String quizesKey = 'quizes';

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> saveQuizesInHistory(String quizes) async {
    await _prefs.setString(quizesKey, quizes);
  }

  String getQuizesHistory() {
    return _prefs.getString(quizesKey) ?? '';
  }
}
