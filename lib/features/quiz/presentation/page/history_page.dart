import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:fast_trivia/features/quiz/presentation/widgets/quizes.dart';
import 'package:fast_trivia/utils/error_message.dart';
import 'package:fast_trivia/utils/request_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
            if (state.fetchHistoryQuizesStatus == RequestStatus.failure) {
              return Center(
                child: ErrorMessage(
                  message:
                      'Não foi possível carregar os quizes, clique para tentar novamente',
                  onTap: () {
                    quizBloc.add(FetchHistoryQuizesEvent());
                  },
                ),
              );
            }

            if (state.fetchHistoryQuizesStatus == RequestStatus.success) {
              if (state.historyQuizes.isEmpty) {
                return Center(
                  child: ErrorMessage(
                    message: 'Você ainda não respondeu nenhum quiz!',
                    onTap: () {
                      quizBloc.add(FetchQuizesEvent());
                    },
                  ),
                );
              }
              return Quizes(
                quizesList: state.historyQuizes.values.toList(),
                isHistory: true,
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
