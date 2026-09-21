import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

void main() {
  const adult = Person(name: 'Karol', age: 30);
  const teenager = Person(name: 'Karyna', age: 17);

  group('Basic & Nullability', () {
    test('equality and identity', () {
      adult.shouldNotBeEqualTo(teenager);
      adult.shouldBe(adult);
    });

    test('nullability promotion and chaining', () {
      final name = adult.name.shouldNotBeNull();
      name.shouldHaveLength(5).shouldStartWith('K').shouldEndWith('l');
    });

    test('types and booleans', () {
      adult.age.shouldBeInstanceOf<int>();
      adult.isAdult.shouldBeTrue();
      teenager.isAdult.shouldBeFalse();
    });
  });

  group('Numerical Assertions', () {
    test('ranges, comparisons, and delta near', () {
      teenager.age
          .shouldBePositive()
          .shouldBeGreaterThan(16)
          .shouldBeLessThan(18)
          .shouldBeInRange(lowerBound: 0, upperBound: 17);

      3.14159.shouldBeNear(3.14, delta: 0.01);
      double.nan.shouldBeNear(double.nan);
    });
  });

  group('String Assertions', () {
    test('patterns, blank checks, and numeric verification', () {
      adult.name
          .shouldNotBeNull()
          .shouldNotBeBlank()
          .shouldMatch(RegExp(r'^[a-zA-Z]+$'))
          .shouldContainIgnoringCase('kar');

      '42'.shouldBeNumeric();
      'abc'.shouldNotBeNumeric();
    });
  });

  group('Collections & Maps', () {
    test('iterable assertions and sorting', () {
      final scores = [10, 20, 30, 40];
      scores
          .shouldNotBeEmpty()
          .shouldHaveSize(4)
          .shouldContain(20)
          .shouldBeSorted()
          .shouldContainSame([40, 30, 20, 10]);

      scores.shouldContainSome((score) => score > 35);
    });

    test('map assertions', () {
      final user = {'id': 1, 'role': 'admin'};
      user
          .shouldHaveKey('role')
          .shouldHaveValue('admin')
          .shouldContain('id', 1)
          .shouldContainSame({'role': 'admin', 'id': 1});
    });
  });

  group('Exceptions', () {
    test('synchronous and asynchronous exception assertions', () async {
      invoking(() => throw ArgumentError('invalid age'))
          .shouldThrow<ArgumentError>()
          .withMessageContaining('invalid age');

      Future<void> asyncTask() async {
        await Future<void>.delayed(const Duration(milliseconds: 10));
        throw const FormatException('failed to parse json');
      }

      final result = await asyncTask.shouldThrow<FormatException>();
      result.withMessage('failed to parse json');
    });
  });

  group('Temporal (DateTime & Duration)', () {
    test('dates and durations', () {
      final eventTime = DateTime(2025, 6, 15, 10, 30);
      eventTime
          .shouldBeInYear(2025)
          .shouldBeInMonth(6)
          .shouldBeOnDay(15)
          .shouldBeAfter(DateTime(2025, 1, 1));

      const timeout = Duration(seconds: 30);
      timeout
          .shouldBeLongerThan(const Duration(seconds: 10))
          .shouldBePositive();
    });
  });

  group('Deep Equivalency', () {
    test('deeply compares complex nested structures', () {
      final payloadA = {
        'meta': {'page': 1},
        'items': [1, 2, 3],
      };
      final payloadB = {
        'meta': {'page': 1},
        'items': [1, 2, 3],
      };

      payloadA.shouldBeEquivalentTo(payloadB);
    });
  });

  group('Soft Assertions', () {
    test('assertSoftly aggregates checks cleanly', () {
      assertSoftly(() {
        adult.name.shouldBeEqualTo('Karol');
        adult.age.shouldBeGreaterThan(20);
        adult.isAdult.shouldBeTrue();
      });
    });
  });
}

class Person {
  final String? name;
  final int age;

  bool get isAdult => age >= 18;

  const Person({
    required this.name,
    required this.age,
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
