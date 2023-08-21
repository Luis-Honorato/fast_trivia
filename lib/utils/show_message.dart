import 'package:flutter/material.dart';

/// Will display a snackBar with a selected message
void showMessage(
  BuildContext context,
  String message, {
  int? durationSeconds,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      actionOverflowThreshold: 1,
      content: Text(message),
      duration: Duration(seconds: durationSeconds ?? 1),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    ),
  );
}
