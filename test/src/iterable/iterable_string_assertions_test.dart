import 'package:fluent_assertions/src/iterable/iterable_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
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

    group('should contain any that', () {
      test(
          'should return normally when at least one element matches the predicate',
          () {
        expect(
          () => capitals.shouldContainAnyThat((c) => c.startsWith('War')),
          returnsNormally,
        );
      });

      test('should fail when no element matches the predicate', () {
        expect(
          () => capitals.shouldContainAnyThat((c) => c.length > 10),
          failsTest,
        );
      });
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

  group('should contain all that', () {
    test('should return normally when all elements match the predicate', () {
      expect(
        () => capitals.shouldContainAllThat(
          (c) => c.startsWith(RegExp('[A-Z]')),
        ),
        returnsNormally,
      );
    });

    test('should fail when some elements matches the predicate', () {
      expect(
        () => capitals.shouldContainAllThat((c) => c.startsWith('War')),
        failsTest,
      );
    });

    test('should fail when no elements match the predicate', () {
      expect(
        () => capitals.shouldContainAllThat((c) => c.isEmpty),
        failsTest,
      );
    });
  });

  group('should contain any that', () {
    test('should return normally when any element match the predicate', () {
      expect(
        () => capitals.shouldContainAnyThat((c) => c.startsWith('B')),
        returnsNormally,
      );
    });

    test('should fail when no elements match the predicate', () {
      expect(
        () => capitals.shouldContainAnyThat((c) => c.startsWith('X')),
        failsTest,
      );
    });
  });

  group('should contain none that', () {
    test('should return normally when no elements match the predicate', () {
      expect(
        () => capitals.shouldContainNoneThat((c) => c.contains('ro')),
        returnsNormally,
      );
    });

    test('should fail when some elements matches the predicate', () {
      expect(
        () => capitals.shouldContainNoneThat((c) => c.startsWith('War')),
        failsTest,
      );
    });

    test('should fail when all elements match the predicate', () {
      expect(
        () => capitals.shouldContainNoneThat((c) => c.isNotEmpty),
        failsTest,
      );
    });
  });
}
