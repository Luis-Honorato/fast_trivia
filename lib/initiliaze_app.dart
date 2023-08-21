import 'package:fast_trivia/features/quiz/data/datasource/shared_preferences_data_source.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:fast_trivia/initial_instances.dart';

Future<void> initializeApp() async {
  await SharedPreferencesDataSource.init();
  quizBloc.add(FetchQuizesEvent());
  quizBloc.add(FetchHistoryQuizesEvent());
}
