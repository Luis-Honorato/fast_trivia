import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:fast_trivia/features/quiz/presentation/widgets/quizes.dart';
import 'package:fast_trivia/utils/error_message.dart';
import 'package:fast_trivia/utils/request_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizesPage extends StatefulWidget {
  const QuizesPage({super.key});

  @override
  State<QuizesPage> createState() => _QuizesPageState();
}

class _QuizesPageState extends State<QuizesPage> {
  late final QuizBloc quizBloc;

  @override
  void initState() {
    super.initState();
    quizBloc = context.read<QuizBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: BlocBuilder<QuizBloc, QuizState>(
          bloc: quizBloc,
          builder: (context, state) {
            if (state.quizesStatus == RequestStatus.failure) {
              return Center(
                child: ErrorMessage(
                  message:
                      'Não foi possível carregar os quizes, clique para tentar novamente',
                  onTap: () {
                    quizBloc.add(FetchQuizesEvent());
                  },
                ),
              );
            }

            if (state.quizesStatus == RequestStatus.success) {
              if (state.quizes.isEmpty) {
                return Center(
                  child: ErrorMessage(
                    message: 'Nada para ver aqui!',
                    onTap: () {
                      quizBloc.add(FetchQuizesEvent());
                    },
                  ),
                );
              }
              return Quizes(
                quizesList: state.quizes.values.toList(),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
