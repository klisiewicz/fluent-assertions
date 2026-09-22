import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
  group('MapAssertions', () {
    final map = {'a': 1, 'b': 2, 'c': 3};

    group('shouldHaveKey / shouldNotHaveKey', () {
      test('should return normally when key exists', () {
        expect(() => map.shouldHaveKey('a'), returnsNormally);
      });

      test('should fail when key does not exist', () {
        expect(() => map.shouldHaveKey('z'), failsTest);
      });

      test('should return normally when key does not exist for notHaveKey', () {
        expect(() => map.shouldNotHaveKey('z'), returnsNormally);
      });

      test('should fail when key exists for notHaveKey', () {
        expect(() => map.shouldNotHaveKey('a'), failsTest);
      });
    });

    group('shouldHaveValue / shouldNotHaveValue', () {
      test('should return normally when value exists', () {
        expect(() => map.shouldHaveValue(2), returnsNormally);
      });

      test('should fail when value does not exist', () {
        expect(() => map.shouldHaveValue(99), failsTest);
      });

      test('should return normally when value does not exist for notHaveValue',
          () {
        expect(() => map.shouldNotHaveValue(99), returnsNormally);
      });

      test('should fail when value exists for notHaveValue', () {
        expect(() => map.shouldNotHaveValue(1), failsTest);
      });
    });

    group('shouldContain / shouldNotContain (key, value)', () {
      test('should return normally when key and value match', () {
        expect(() => map.shouldContain('b', 2), returnsNormally);
      });

      test('should fail when key exists but value differs', () {
        expect(() => map.shouldContain('b', 99), failsTest);
      });

      test('should fail when key does not exist', () {
        expect(() => map.shouldContain('z', 1), failsTest);
      });

      test('should return normally when entry does not match for notContain',
          () {
        expect(() => map.shouldNotContain('b', 99), returnsNormally);
        expect(() => map.shouldNotContain('z', 1), returnsNormally);
      });

      test('should fail when entry matches for notContain', () {
        expect(() => map.shouldNotContain('a', 1), failsTest);
      });
    });

    group('shouldContainEntry / shouldNotContainEntry', () {
      test('should return normally when entry matches', () {
        expect(
          () => map.shouldContainEntry(const MapEntry('a', 1)),
          returnsNormally,
        );
      });

      test('should fail when entry differs', () {
        expect(
          () => map.shouldContainEntry(const MapEntry('a', 99)),
          failsTest,
        );
      });

      test('should return normally when entry differs for notContainEntry', () {
        expect(
          () => map.shouldNotContainEntry(const MapEntry('z', 1)),
          returnsNormally,
        );
      });

      test('should fail when entry exists for notContainEntry', () {
        expect(
          () => map.shouldNotContainEntry(const MapEntry('a', 1)),
          failsTest,
        );
      });
    });

    group('shouldContainSame / shouldNotContainSame', () {
      test(
          'should return normally when maps have same entries regardless of order',
          () {
        final same = {'c': 3, 'a': 1, 'b': 2};
        expect(() => map.shouldContainSame(same), returnsNormally);
      });

      test('should fail when maps have different values', () {
        final diffVal = {'a': 1, 'b': 99, 'c': 3};
        expect(() => map.shouldContainSame(diffVal), failsTest);
      });

      test('should fail when maps have different size', () {
        final subset = {'a': 1, 'b': 2};
        expect(() => map.shouldContainSame(subset), failsTest);
      });

      test('should return normally when maps differ for notContainSame', () {
        final diff = {'a': 1, 'b': 99};
        expect(() => map.shouldNotContainSame(diff), returnsNormally);
      });

      test('should fail when maps are same for notContainSame', () {
        final same = {'a': 1, 'b': 2, 'c': 3};
        expect(() => map.shouldNotContainSame(same), failsTest);
      });
    });

    group('shouldHaveSize / shouldHaveCount', () {
      test('should return normally when size matches', () {
        expect(() => map.shouldHaveSize(3), returnsNormally);
        expect(() => map.shouldHaveCount(3), returnsNormally);
      });

      test('should fail when size differs', () {
        expect(() => map.shouldHaveSize(2), failsTest);
        expect(() => map.shouldHaveCount(4), failsTest);
      });
    });

    group('shouldBeEmpty / shouldNotBeEmpty', () {
      test('should return normally for empty map', () {
        expect(() => <String, int>{}.shouldBeEmpty(), returnsNormally);
      });

      test('should fail for non-empty map with shouldBeEmpty', () {
        expect(() => map.shouldBeEmpty(), failsTest);
      });

      test('should return normally for non-empty map with shouldNotBeEmpty',
          () {
        expect(() => map.shouldNotBeEmpty(), returnsNormally);
      });

      test('should fail for empty map with shouldNotBeEmpty', () {
        expect(() => <String, int>{}.shouldNotBeEmpty(), failsTest);
      });
    });

    test('supports fluid chaining', () {
      expect(
        () => map
            .shouldNotBeEmpty()
            .shouldHaveSize(3)
            .shouldHaveKey('a')
            .shouldHaveValue(1)
            .shouldContain('b', 2),
        returnsNormally,
      );
    });
  });
}
