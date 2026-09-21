import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
  group('EquivalencyAssertions', () {
    test('deeply compares nested maps and lists', () {
      final a = {
        'users': [
          {
            'name': 'Alice',
            'roles': ['admin', 'user']
          },
          {
            'name': 'Bob',
            'roles': ['user']
          },
        ],
        'count': 2,
      };

      final b = {
        'users': [
          {
            'name': 'Alice',
            'roles': ['admin', 'user']
          },
          {
            'name': 'Bob',
            'roles': ['user']
          },
        ],
        'count': 2,
      };

      expect(() => a.shouldBeEquivalentTo(b), returnsNormally);
    });

    test('fails when nested value differs', () {
      final a = {
        'users': [
          {'name': 'Alice'},
        ],
      };
      final b = {
        'users': [
          {'name': 'Bob'},
        ],
      };

      expect(() => a.shouldBeEquivalentTo(b), failsTest);
    });

    test('compares DateTimes by moment', () {
      final a = {'time': DateTime.utc(2023, 1, 1, 12)};
      final b = {'time': DateTime.utc(2023, 1, 1, 12).toLocal()};

      expect(() => a.shouldBeEquivalentTo(b), returnsNormally);
    });

    test('compares NaN as equivalent to NaN', () {
      expect(
          () => double.nan.shouldBeEquivalentTo(double.nan), returnsNormally);
    });

    test('compares Sets by elements regardless of order', () {
      final a = {1, 2, 3};
      final b = {3, 1, 2};

      expect(() => a.shouldBeEquivalentTo(b), returnsNormally);
    });

    test('shouldNotBeEquivalentTo passes when different', () {
      expect(() => [1, 2].shouldNotBeEquivalentTo([2, 3]), returnsNormally);
      expect(() => [1, 2].shouldNotBeEquivalentTo([1, 2]), failsTest);
    });

    test('supports fluid chaining', () {
      expect(
        () => {'a': 1}
            .shouldBeEquivalentTo({'a': 1}).shouldNotBeEquivalentTo({'a': 2}),
        returnsNormally,
      );
    });
  });
}
