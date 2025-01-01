import 'package:fluent_assertions/src/iterable/iterable_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
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

  group('should contain any', () {
    test('should return normally when contains at least one element', () {
      expect(
        () => primes.shouldContainAny([1, 2]),
        returnsNormally,
      );
    });

    test('should fail when not contains any element', () {
      expect(
        () => primes.shouldContainAny([1, 4]),
        failsTest,
      );
    });
  });

  group('should contain none', () {
    test('should return normally when not contain any element', () {
      expect(
        () => primes.shouldContainNone([0, 1, 4]),
        returnsNormally,
      );
    });

    test('should fail when contains an element', () {
      expect(
        () => primes.shouldContainNone([0, 1, 2]),
        failsTest,
      );
    });
  });

  group('should contain all', () {
    test('should return normally when contains all in order', () {
      expect(
        () => primes.shouldContainAll([2]),
        returnsNormally,
      );
      expect(
        () => primes.shouldContainAll([2, 3]),
        returnsNormally,
      );
    });

    test('should return normally when contains all in any order', () {
      expect(
        () => primes.shouldContainAll([7]),
        returnsNormally,
      );
      expect(
        () => primes.shouldContainAll([5, 2, 7]),
        returnsNormally,
      );
    });

    test('should fail when not contain all', () {
      expect(
        () => primes.shouldContainAll([1]),
        failsTest,
      );
      expect(
        () => primes.shouldContainAll([3, 2, 1]),
        failsTest,
      );
    });

    group('should contain any that', () {
      test(
          'should return normally when at least one element matches the predicate',
          () {
        expect(
          () => primes.shouldContainAnyThat((e) => e >= 7),
          returnsNormally,
        );
      });

      test('should fail when no element matches the predicate', () {
        expect(
          () => primes.shouldContainAnyThat((p) => p < 0),
          failsTest,
        );
      });
    });
  });

  group('should contain none that', () {
    test('should return normally when no elements match the predicate', () {
      expect(
        () => primes.shouldContainNoneThat((p) => p <= 0),
        returnsNormally,
      );
    });

    test('should fail when some elements matches the predicate', () {
      expect(
        () => primes.shouldContainNoneThat((p) => p <= 2),
        failsTest,
      );
    });

    test('should fail when all elements match the predicate', () {
      expect(
        () => primes.shouldContainNoneThat((p) => p >= 0),
        failsTest,
      );
    });
  });

  group('should contain all in order', () {
    test('should return normally when contains all in order', () {
      expect(
        () => primes.shouldContainAllInOrder([2]),
        returnsNormally,
      );
      expect(
        () => primes.shouldContainAllInOrder([2, 3]),
        returnsNormally,
      );
    });

    test('should fail when contains all not in order', () {
      expect(
        () => primes.shouldContainAllInOrder([5, 2, 7]),
        failsTest,
      );
    });

    test('should fail when not contain all', () {
      expect(
        () => primes.shouldContainAllInOrder([1]),
        failsTest,
      );
      expect(
        () => primes.shouldContainAllInOrder([3, 2, 1]),
        failsTest,
      );
    });
  });
}
