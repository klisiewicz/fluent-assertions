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
        expect(() => capitals.shouldContain('Barcelona'), failsTest);
      });

      test('should fail when contains with different case', () {
        expect(() => capitals.shouldContain('BERLIN'), failsTest);
      });
    });

    group('should not contain', () {
      test('should return normally when not contains', () {
        expect(() => capitals.shouldNotContain('Barcelona'), returnsNormally);
      });

      test('should fail when contains', () {
        expect(() => capitals.shouldNotContain('Berlin'), failsTest);
      });

      test('should return normally when contains with different case', () {
        expect(() => capitals.shouldContain('BERLIN'), failsTest);
      });
    });

    group('should contain any', () {
      test('should return normally when contains at least one element', () {
        expect(
          () => capitals.shouldContainAny(['Berlin', 'Barcelona']),
          returnsNormally,
        );
      });

      test('should fail when contains with different case', () {
        expect(
          () => capitals.shouldContainAny(['BERLIN']),
          failsTest,
        );
      });

      test('should fail when not contains any element', () {
        expect(
          () => capitals.shouldContainAny(['Barcelona']),
          failsTest,
        );
      });
    });

    group('should contain any ignoring case', () {
      test('should return normally when contains at least one element', () {
        expect(
          () => capitals.shouldContainAnyIgnoringCase(['BERLIN', 'Barcelona']),
          returnsNormally,
        );
      });

      test('should fail when not contains any element', () {
        expect(
          () => capitals.shouldContainAny(['Barcelona']),
          failsTest,
        );
      });
    });

    group('should contain none', () {
      test('should return normally when not contain any element', () {
        expect(
          () => capitals.shouldContainNone(['Barcelona', 'Porto']),
          returnsNormally,
        );
      });

      test('should return normally when contains with different case', () {
        expect(
          () => capitals.shouldContainNone(['BERLIN']),
          returnsNormally,
        );
      });

      test('should fail when contains an element', () {
        expect(
          () => capitals.shouldContainNone(['Barcelona', 'Porto', 'Warsaw']),
          failsTest,
        );
      });
    });

    group('should contain none ignoring case', () {
      test('should return normally when not contain any element', () {
        expect(
          () => capitals.shouldContainNoneIgnoringCase(['Porto', 'Barcelona']),
          returnsNormally,
        );
      });

      test('should fail when contains an element', () {
        expect(
          () => capitals.shouldContainNoneIgnoringCase(['Porto', 'WARSAW']),
          failsTest,
        );
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
        expect(() => capitals.shouldContain('Barcelona'), failsTest);
      });
    });

    group('should not contain ignoring case', () {
      test('should return normally when not contains', () {
        expect(
          () => capitals.shouldNotContainIgnoringCase('Barcelona'),
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

    group('should contain all', () {
      test('should return normally when contains all in order', () {
        expect(
          () => capitals.shouldContainAll(['Berlin']),
          returnsNormally,
        );
        expect(
          () => capitals.shouldContainAll(['Berlin', 'Warsaw']),
          returnsNormally,
        );
      });

      test('should return normally when contains all in any order', () {
        expect(
          () => capitals.shouldContainAll(['Warsaw']),
          returnsNormally,
        );
        expect(
          () => capitals.shouldContainAll(['Warsaw', 'Berlin']),
          returnsNormally,
        );
      });

      test('should fail when not contain all', () {
        expect(
          () => capitals.shouldContainAll(['Barcelona']),
          failsTest,
        );
        expect(
          () => capitals.shouldContainAll(['Berlin, Barcelona']),
          failsTest,
        );
      });
    });

    group('should contain all in order', () {
      test('should return normally when contains all in order', () {
        expect(
          () => capitals.shouldContainAllInOrder(['Berlin']),
          returnsNormally,
        );
        expect(
          () => capitals.shouldContainAllInOrder(['Berlin', 'Warsaw']),
          returnsNormally,
        );
      });

      test('should fail when contains all not in order', () {
        expect(
          () => capitals.shouldContainAllInOrder(['Warsaw', 'Berlin']),
          failsTest,
        );
      });

      test('should fail when not contain all', () {
        expect(
          () => capitals.shouldContainAllInOrder(['Barcelona']),
          failsTest,
        );
        expect(
          () => capitals.shouldContainAllInOrder(['Berlin, Barcelona']),
          failsTest,
        );
      });
    });

    group('should contain all ignoring case', () {
      test('should return normally when contains all in order', () {
        expect(
          () => capitals.shouldContainAllIgnoringCase(['BERLIN']),
          returnsNormally,
        );
        expect(
          () => capitals.shouldContainAllIgnoringCase(['BERLIN', 'warsaw']),
          returnsNormally,
        );
      });

      test('should return normally when contains all in any order', () {
        expect(
          () => capitals.shouldContainAllIgnoringCase(['warsaw']),
          returnsNormally,
        );
        expect(
          () => capitals.shouldContainAllIgnoringCase(['warsaw', 'BERLIN']),
          returnsNormally,
        );
      });

      test('should fail when not contain all', () {
        expect(
          () => capitals.shouldContainAllIgnoringCase(['Barcelona']),
          failsTest,
        );
        expect(
          () => capitals.shouldContainAllIgnoringCase(['Berlin, Barcelona']),
          failsTest,
        );
      });
    });

    group('should contain all in order ignoring case', () {
      test('should return normally when contains all in order', () {
        expect(
          () => capitals.shouldContainAllInOrderIgnoringCase(
            ['BERLIN'],
          ),
          returnsNormally,
        );
        expect(
          () => capitals.shouldContainAllInOrderIgnoringCase(
            ['BERLIN', 'warsaw'],
          ),
          returnsNormally,
        );
      });

      test('should fail when contains all not in order', () {
        expect(
          () => capitals.shouldContainAllInOrderIgnoringCase(
            ['warsaw', 'BERLIN'],
          ),
          failsTest,
        );
      });

      test('should fail when not contain all', () {
        expect(
          () => capitals.shouldContainAllInOrderIgnoringCase(
            ['Barcelona'],
          ),
          failsTest,
        );
        expect(
          () => capitals.shouldContainAllInOrderIgnoringCase(
            ['BERLIN, Barcelona'],
          ),
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
  });

  group('objects', () {
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
  });
}
