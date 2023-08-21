import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/presentation/widgets/questions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizPage extends StatelessWidget {
  final Quiz quiz;
  const QuizPage({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0.5,
        backgroundColor: const Color(0xFFE6E6E6),
        title: const Row(
          children: [
            Text(
              'Fast ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Trivia',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: GradientRotation(24),
            colors: [
              AppColors.backgroundGradientColor,
              Colors.white,
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 25,
        ),
        child: const Questions(),
      ),
    );
  }
}
