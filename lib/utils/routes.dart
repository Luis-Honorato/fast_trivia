import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/presentation/page/nav_bar.dart';
import 'package:fast_trivia/features/quiz/presentation/page/quiz_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NavBar(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) => QuizPage(quiz: state.extra as Quiz),
    )
  ],
);
