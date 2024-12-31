import 'package:fluent_assertions/src/iterable/iterable_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';
import '../util/person.dart';

void main() {
  const alice = Person(name: 'Alice');
  const bob = Person(name: 'Bob');
  const jimmy = Person(name: 'Jimmy');

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

  group('should contain any', () {
    test('should return normally when contains at least one element', () {
      expect(
        () => [alice, bob].shouldContainAny([alice, jimmy]),
        returnsNormally,
      );
    });

    test('should fail when not contains any element', () {
      expect(
        () => [alice, bob].shouldContainAny([jimmy]),
        failsTest,
      );
    });

    test('should fail when expected is empty', () {
      expect(
        () => [alice, bob].shouldContainAny([]),
        failsTest,
      );
    });
  });

  group('should contain none', () {
    test('should return normally when not contain any element', () {
      expect(
        () => [alice, bob].shouldContainNone([jimmy]),
        returnsNormally,
      );
    });

    test('should fail when contains an element', () {
      expect(
        () => [alice, bob].shouldContainNone([bob, jimmy]),
        failsTest,
      );
    });

    test('should return normally when expected is empty', () {
      expect(
        () => [alice, bob].shouldContainNone([]),
        returnsNormally,
      );
    });
  });

  group('should contain all', () {
    test('should return normally when contains all in order', () {
      expect(
        () => [alice, bob].shouldContainAll([alice]),
        returnsNormally,
      );
      expect(
        () => [alice, bob].shouldContainAll([alice, bob]),
        returnsNormally,
      );
    });

    test('should return normally when contains all in any order', () {
      expect(
        () => [alice, bob].shouldContainAll([bob]),
        returnsNormally,
      );
      expect(
        () => [alice, bob].shouldContainAll([bob, alice]),
        returnsNormally,
      );
    });

    test('should fail when not contain all', () {
      expect(
        () => [alice, bob].shouldContainAll([jimmy]),
        failsTest,
      );
      expect(
        () => [alice, bob].shouldContainAll([alice, bob, jimmy]),
        failsTest,
      );
    });
  });

  group('should contain all', () {
    test('should return normally when contains all in order', () {
      expect(
        () => [alice, bob].shouldContainAllInOrder([alice]),
        returnsNormally,
      );
      expect(
        () => [alice, bob].shouldContainAllInOrder([alice, bob]),
        returnsNormally,
      );
    });

    test('should fail when contains all not in order', () {
      expect(
        () => [alice, bob].shouldContainAllInOrder([bob, alice]),
        failsTest,
      );
    });

    test('should fail when not contain all', () {
      expect(
        () => [alice, bob].shouldContainAllInOrder([jimmy]),
        failsTest,
      );
      expect(
        () => [alice, bob].shouldContainAllInOrder([alice, bob, jimmy]),
        failsTest,
      );
    });
  });

  group('should contain any that', () {
    test(
        'should return normally when at least one element matches the predicate',
        () {
      expect(
        () => [alice, bob].shouldContainAnyThat((p) => p.name.contains('Al')),
        returnsNormally,
      );
    });

    test('should fail when no element matches the predicate', () {
      expect(
        () => [alice, bob].shouldContainAnyThat((p) => p.name.contains('x')),
        failsTest,
      );
    });
  });

  group('should contain all that', () {
    test('should return normally when all elements match the predicate', () {
      expect(
        () => [alice, bob].shouldContainAllThat((p) => p.name.isNotEmpty),
        returnsNormally,
      );
    });

    test('should fail when some elements matches the predicate', () {
      expect(
        () => [alice, bob].shouldContainAllThat((p) => p.name.contains('o')),
        failsTest,
      );
    });

    test('should fail when no elements matches the predicate', () {
      expect(
        () => [alice, bob].shouldContainAllThat((p) => p.name.contains('x')),
        failsTest,
      );
    });
  });

  group('should contain none that', () {
    test('should return normally when no elements match the predicate', () {
      expect(
        () => [alice, bob].shouldContainNoneThat((p) => p.name.isEmpty),
        returnsNormally,
      );
    });

    test('should fail when some elements matches the predicate', () {
      expect(
        () => [alice, bob].shouldContainNoneThat((p) => p.name.contains('o')),
        failsTest,
      );
    });

    test('should fail when all elements match the predicate', () {
      expect(
        () => [alice, bob].shouldContainNoneThat((p) => p.name.isNotEmpty),
        failsTest,
      );
    });
  });

  group('should all be instance of', () {
    test('should return normally when all elements are expected type', () {
      expect(
        () => [1, 2, 3].shouldAllBeInstanceOf<int>(),
        returnsNormally,
      );
    });

    test(
        'should return normally when all elements are subtypes of expected type',
        () {
      expect(
        () => [1, 2.0, 3.14].shouldAllBeInstanceOf<num>(),
        returnsNormally,
      );
    });

    test('should fail when at least one element is not of expected type', () {
      expect(
        () => [1, 2.0, '3.14'].shouldAllBeInstanceOf<num>(),
        failsTest,
      );
    });
  });

  group('should any be instance of', () {
    test('should return normally when all elements are of expected type', () {
      expect(
        () => [1, 2.0, 3].shouldAnyBeInstanceOf<num>(),
        returnsNormally,
      );
    });

    test(
        'should return normally when at least one element is not of expected type',
        () {
      expect(
        () => [1, '2.0', 3.14].shouldAnyBeInstanceOf<double>(),
        returnsNormally,
      );
    });

    test('should fail when no elements are of expected type', () {
      expect(
        () => [1, 2.0, 3.14].shouldAnyBeInstanceOf<String>(),
        failsTest,
      );
    });
  });

  group('should none be instance of', () {
    test('should return normally when no elements are of expected type', () {
      expect(
        () => [1, 2, 3].shouldNoneBeInstanceOf<String>(),
        returnsNormally,
      );
    });

    test('should fail when some elements are of expected type', () {
      expect(
        () => ['1', 2, 3].shouldNoneBeInstanceOf<String>(),
        failsTest,
      );
    });
  });
}
