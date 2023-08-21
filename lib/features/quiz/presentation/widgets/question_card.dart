import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/domain/entities/question.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:fast_trivia/features/quiz/presentation/widgets/alternative_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int idx = 0; idx < 3; idx++) ...[
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Text('${question.id} - ${question.question}'),
          const SizedBox(height: 5),
          ...question.alternatives.map(
            (alternative) => Padding(
              padding: const EdgeInsets.all(8),
              child: BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  final int? userAnswer =
                      state.currentQuiz!.questions[question.id]!.userAnswer;
                  final quiz = state.currentQuiz!;
                  return AlternativeCard(
                    alternative: alternative,
                    isAlternativeSelected: userAnswer == alternative.id,
                    correctAnswer: question.answer,
                    onTap: () {
                      if (!quiz.isCompleted) {
                        context.read<QuizBloc>().add(
                              AnswerQuestionEvent(
                                alternativeID: alternative.id,
                                question: question,
                              ),
                            );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
