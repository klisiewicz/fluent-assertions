import 'package:test/test.dart';
import 'package:fluent_assertions/fluent_assertions.dart';

void main() {
  const adult = Person(name: 'Karol', age: 30);
  const teenager = Person(name: 'Karyna', age: 17);

  test('different persons should not be equal', () {
    adult.shouldNotBeEqualTo(teenager);
  });

  test('person name should not be null', () {
    adult.name.shouldNotBeNull();
  });

  test('person age should be integer', () {
    adult.age.shouldBeInstanceOf<int>();
  });

  test('a person over 18 should be adult', () {
    adult.isAdult.shouldBeTrue();
  });

  test('an adult person should be over 18', () {
    adult.age.shouldBeGreaterOrEqualTo(18);
  });

  test('a teenager can driver a car', () {
    teenager.age.shouldBeGreaterThan(16);
  });

  test('a teenager should be below 18', () {
    teenager.age.shouldBeLessThan(18);
  });

  test('a teenager should be below 18', () {
    teenager.age.shouldBeInRange(lowerBound: 0, upperBound: 17);
  });

  test('a person age should be positive', () {
    teenager.age.shouldBePositive();
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