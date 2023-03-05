import 'package:flutter_test/flutter_test.dart';
import 'package:imccalculator/model/person.dart';

void main() {
  test('Teste IMC', () {
    Person person = Person(age: 18, gender: false, height: 190, weight: 85);

    expect(person.calculateImc(person).round(), 24);
  });
}
