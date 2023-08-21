import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/domain/entities/quiz.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:fast_trivia/features/quiz/presentation/widgets/quiz_card.dart';
import 'package:fast_trivia/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Quizes extends StatelessWidget {
  final List<Quiz> quizesList;
  final bool isHistory;
  const Quizes({
    super.key,
    required this.quizesList,
    this.isHistory = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      isHistory ? 'Histórico de ' : 'Meus ',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Quizes:',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
                if (isHistory)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Button(
                      text: 'Apagar Histórico',
                      width: 130,
                      height: 30,
                      textFontSize: 14,
                      onTap: () =>
                          context.read<QuizBloc>().add(EreaseHistoryEvent()),
                    ),
                  ),
                for (Quiz quiz in quizesList)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: QuizCard(
                      quiz: quiz,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
