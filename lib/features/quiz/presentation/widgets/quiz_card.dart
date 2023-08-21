import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  const QuizCard({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<QuizBloc>().add(SetCurrentQuizEvent(quiz));

        context.push(
          '/quiz',
          extra: quiz,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.borderColor),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.cardsGradientPrimaryColor,
              AppColors.cardsGradientSecondColor,
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '# ${quiz.title}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  children: [
                    const Text('Dificuldade: '),
                    const SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: _difficultColor(),
                      ),
                      width: 30,
                      height: 12,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  quiz.isCompleted ? '${quiz.correctAnswers}/5' : '- /5',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 173, 173, 173),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  quiz.isCompleted ? 'Visualizar' : 'Iniciar Quiz',
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Returns the color according with the quiz difficult
  Color _difficultColor() {
    if (quiz.difficulty == 1) {
      return AppColors.green;
    } else if (quiz.difficulty == 2) {
      return AppColors.yellow;
    } else {
      return AppColors.red;
    }
  }
}
