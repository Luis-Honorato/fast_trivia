import 'package:fast_trivia/features/quiz/data/adapter/alternatives_adapter.dart';
import 'package:fast_trivia/features/quiz/domain/entities/alternative.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeAlternativeJson = [
    {
      "id": 1,
      "titulo": "Papa",
    },
    {
      "id": 2,
      "titulo": "Presidente do Brasil",
    },
    {
      "id": 3,
      "titulo": "Presidente dos Estados Unidos",
    },
    {
      "id": 4,
      "titulo": "Prefeito",
    },
  ];
  test('Should return a list of Alternatives when call fromJson method', () {
    const Alternative expectedAlternative = Alternative(
      id: 2,
      title: 'Presidente do Brasil',
    );

    final alternatives = AlternativesAdapter.fromJson(fakeAlternativeJson);

    expect(alternatives[1], equals(expectedAlternative));
  });

  const fakeAlternativesList = [
    Alternative(id: 1, title: 'title1'),
    Alternative(id: 2, title: 'title2'),
    Alternative(id: 3, title: 'title3'),
    Alternative(id: 4, title: 'title4'),
  ];

  test(
    'Should return a List<Map<String, dynamic>> when call toJson method',
    () {
      const expectedJson = [
        {
          "id": 1,
          "titulo": "title1",
        },
        {
          "id": 2,
          "titulo": "title2",
        },
        {
          "id": 3,
          "titulo": "title3",
        },
        {
          "id": 4,
          "titulo": "title4",
        },
      ];

      final alternativesJsonList =
          AlternativesAdapter.toJson(fakeAlternativesList);

      expect(alternativesJsonList[0], expectedJson[0]);
    },
  );
}
