import 'package:test/test.dart';
import 'package:fluent_assertions/fluent_assertions.dart';

void main() {
  const somePerson = Person(name: 'Karol', age: 30);
  const someOtherPerson = Person(name: 'Karyna', age: 17);

  test('different persons should not be equal', () {
    somePerson.shouldNotBeEqualTo(someOtherPerson);
  });

  test('person name should not be null', () {
    somePerson.name.shouldNotBeNull();
  });

  test('person age should be integer', () {
    somePerson.age.shouldBeInstanceOf<int>();
  });

  test('a person over 18 should be adult', () {
    somePerson.isAdult.shouldBeTrue();
  });
}


class Person {
  final String name;
  final int age;
  bool get isAdult => age >= 18;

  const Person({
    this.name,
    this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() => '$name ($age)';
}