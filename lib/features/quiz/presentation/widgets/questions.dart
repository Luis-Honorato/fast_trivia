import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/domain/entities/question.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:fast_trivia/features/quiz/presentation/widgets/question_card.dart';
import 'package:fast_trivia/initial_instances.dart';
import 'package:fast_trivia/utils/button.dart';
import 'package:fast_trivia/utils/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      children: [
        BlocBuilder<QuizBloc, QuizState>(
          buildWhen: (previous, current) =>
              previous.currentQuiz != current.currentQuiz,
          builder: (context, state) {
            final quiz = state.currentQuiz!;
            return Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Quiz: ',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                    ),
                    Text(
                      quiz.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (quiz.isCompleted)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        const Text(
                          'Resultado: ',
                          style: TextStyle(
                            color: AppColors.textSecondaryColor,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.selectedAlternativeColor,
                          ),
                          width: 50,
                          height: 24,
                          child: Center(
                            child: Text('${quiz.correctAnswers}/5'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ...quiz.questions.values.map(
                  (question) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: QuestionCard(question: question),
                  ),
                ),
                const SizedBox(height: 40),
                if (!quiz.isCompleted)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Button(
                      text: 'Enviar',
                      onTap: () {
                        _isQuizValid(quiz.questions)
                            ? {
                                quizBloc.add(SendQuizEvent(
                                  correctAnswers:
                                      _correctAnswers(quiz.questions),
                                )),
                                _scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                ),
                              }
                            : showMessage(
                                context,
                                'Responda todas as perguntas do quiz!',
                                durationSeconds: 3,
                              );
                      },
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ],
    );
  }

  bool _isQuizValid(Map<int, Question> questions) {
    bool isQuizValid = true;
    for (Question question in questions.values) {
      if (question.userAnswer == null) {
        isQuizValid = false;
      }
    }

    return isQuizValid;
  }

  int _correctAnswers(Map<int, Question> questions) {
    int correctAnswers = 0;
    for (Question question in questions.values) {
      if (question.isAnsweredCorrectly) {
        correctAnswers++;
      }
    }

    return correctAnswers;
  }
}
