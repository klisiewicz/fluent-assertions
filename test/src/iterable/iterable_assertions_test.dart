import 'package:fluent_assertions/src/iterable/iterable_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';
import '../util/person.dart';

void main() {
  group('strings', () {
    const capitals = ['Berlin', 'Warsaw'];

    group('should contain', () {
      test('should return normally when contains', () {
        expect(() => capitals.shouldContain('Berlin'), returnsNormally);
      });

      test('should fail when not contains', () {
        expect(() => capitals.shouldContain('Munich'), failsTest);
      });
    });

    group('should not contain', () {
      test('should return normally when not contains', () {
        expect(() => capitals.shouldNotContain('Munich'), returnsNormally);
      });

      test('should fail when contains', () {
        expect(() => capitals.shouldNotContain('Berlin'), failsTest);
      });
    });

    group('should contain ignoring case', () {
      test('should return normally when contains with same case', () {
        expect(
          () => capitals.shouldContainIgnoringCase('Berlin'),
          returnsNormally,
        );
      });

      test('should return normally when contains with same case', () {
        expect(
          () => capitals.shouldContainIgnoringCase('BERLIN'),
          returnsNormally,
        );
        expect(
          () => capitals.shouldContainIgnoringCase('berlin'),
          returnsNormally,
        );
      });

      test('should fail when not contains', () {
        expect(() => capitals.shouldContain('Munich'), failsTest);
      });
    });

    group('should not contain ignoring case', () {
      test('should return normally when not contains', () {
        expect(
          () => capitals.shouldNotContainIgnoringCase('MUNICH'),
          returnsNormally,
        );
      });

      test('should fail when contains', () {
        expect(
          () => capitals.shouldNotContainIgnoringCase('berlin'),
          failsTest,
        );
      });
    });
  });

  group('numbers', () {
    const primes = [2, 3, 5, 7];

    group('should contain', () {
      test('should return normally when contains', () {
        expect(() => primes.shouldContain(2), returnsNormally);
      });

      test('should fail when not contains', () {
        expect(() => primes.shouldContain(4), failsTest);
      });
    });

    group('should not contain', () {
      test('should return normally when not contains', () {
        expect(() => primes.shouldNotContain(4), returnsNormally);
      });

      test('should fail when contains', () {
        expect(() => primes.shouldNotContain(2), failsTest);
      });
    });
  });

  group('objects', () {
    const alice = Person(name: 'Alice');
    const bob = Person(name: 'Bob');

    group('should contain', () {
      test('should return normally when contains', () {
        expect(() => [alice, bob].shouldContain(alice), returnsNormally);
      });

      test('should fail when not contains', () {
        expect(() => [bob].shouldContain(alice), failsTest);
      });
    });

    group('should not contain', () {
      test('should return normally when not contains', () {
        expect(() => [bob].shouldNotContain(alice), returnsNormally);
      });

      test('should fail when contains', () {
        expect(() => [alice, bob].shouldNotContain(bob), failsTest);
      });
    });
  });
}
