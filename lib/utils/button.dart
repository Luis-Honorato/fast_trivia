import 'package:fast_trivia/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onTap;
  final double? width;
  final double? height;
  final double? textFontSize;
  const Button({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.textFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.primaryColor,
              AppColors.purple,
            ],
          ),
        ),
        height: height ?? 55,
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textFontSize ?? 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
