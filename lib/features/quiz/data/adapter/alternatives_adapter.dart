import 'package:fast_trivia/features/quiz/domain/entities/alternative.dart';

class AlternativesAdapter {
  const AlternativesAdapter._();

  /// Method to Adapte a json received and return a List of Alternative
  static List<Alternative> fromJson(List<Map<String, dynamic>> json) {
    return json
        .map((alternative) => Alternative(
              id: alternative['id'],
              title: alternative['titulo'],
            ))
        .toList();
  }

  /// Method to Adapte a ```List<Alternatives>``` received and returns a
  /// ```List<Map<String, dynamic>>```
  ///
  /// Is used to Adaptate the Alternatives of the Quiz to a Json.
  static List<Map<String, dynamic>> toJson(List<Alternative> alternatives) {
    final List<Map<String, dynamic>> alternativesList = [];
    for (Alternative alternative in alternatives) {
      alternativesList.add({
        "id": alternative.id,
        "titulo": alternative.title,
      });
    }
    return alternativesList;
  }
}
