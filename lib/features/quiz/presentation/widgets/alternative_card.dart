import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/domain/entities/alternative.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlternativeCard extends StatelessWidget {
  final Alternative alternative;
  final Function onTap;
  final bool isAlternativeSelected;
  final int correctAnswer;
  const AlternativeCard({
    super.key,
    required this.alternative,
    required this.onTap,
    required this.isAlternativeSelected,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final bool isQuizCompleted = context.select(
      (QuizBloc bloc) => bloc.state.currentQuiz!.isCompleted,
    );
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
              color: isAlternativeSelected
                  ? _selectAnsweredColor(
                      isQuizCompleted: isQuizCompleted,
                      selectedColor: AppColors.primaryColor,
                      correctAnswer: correctAnswer,
                    )
                  : _selectAnsweredColor(
                      isQuizCompleted: isQuizCompleted,
                      selectedColor: AppColors.borderColor,
                      correctAnswer: correctAnswer,
                    )),
          color: isAlternativeSelected && !isQuizCompleted
              ? AppColors.selectedAlternativeColor
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectAnsweredColor(
                      isQuizCompleted: isQuizCompleted,
                      selectedColor: AppColors.primaryColor,
                      correctAnswer: correctAnswer,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    _selectAlternativeLetter(),
                    style: TextStyle(
                      color: _selectAnsweredColor(
                        isQuizCompleted: isQuizCompleted,
                        selectedColor: AppColors.primaryColor,
                        correctAnswer: correctAnswer,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  alternative.title,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: _selectAnsweredColor(
                      isQuizCompleted: isQuizCompleted,
                      selectedColor: Colors.black,
                      correctAnswer: correctAnswer,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _selectAlternativeLetter() {
    if (alternative.id == 1) {
      return 'a';
    } else if (alternative.id == 2) {
      return 'b';
    } else if (alternative.id == 3) {
      return 'c';
    } else {
      return 'd';
    }
  }

  Color _selectAnsweredColor({
    required bool isQuizCompleted,
    required Color selectedColor,
    required int correctAnswer,
  }) {
    if (isQuizCompleted && isAlternativeSelected) {
      return correctAnswer == alternative.id ? AppColors.green : AppColors.red;
    } else {
      return correctAnswer == alternative.id && isQuizCompleted
          ? AppColors.green
          : selectedColor;
    }
  }
}
