import 'package:equatable/equatable.dart';

class Alternative extends Equatable {
  final int id;
  final String title;

  const Alternative({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}
