import 'package:fast_trivia/app_colors.dart';
import 'package:fast_trivia/features/quiz/presentation/page/history_page.dart';
import 'package:fast_trivia/features/quiz/presentation/page/quizes_page.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo.png'),
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
      body: PageView(
        controller: _pageController,
        onPageChanged: _setPaginaAtual,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          QuizesPage(),
          HistoryPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_rounded),
            label: 'Quizes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
        ],
        onTap: (index) => _pageController.animateToPage(
          index,
          duration: const Duration(
            milliseconds: 200,
          ),
          curve: Curves.bounceInOut,
        ),
      ),
    );
  }

  _setPaginaAtual(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
