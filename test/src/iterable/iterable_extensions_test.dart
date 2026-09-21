import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
  group('IterableExtensions additional tests', () {
    group('shouldContainSame / shouldNotContainSame', () {
      test('passes when elements match regardless of order', () {
        expect(() => [1, 2, 3].shouldContainSame([3, 1, 2]), returnsNormally);
        expect(
            () => [1, 2, 3].shouldEqualUnordered([3, 1, 2]), returnsNormally);
      });

      test('passes when duplicates match in frequencies', () {
        expect(() => [1, 2, 2, 3].shouldContainSame([2, 1, 3, 2]),
            returnsNormally);
      });

      test('fails when frequencies differ', () {
        expect(() => [1, 2, 2, 3].shouldContainSame([1, 2, 3, 3]), failsTest);
      });

      test('fails when elements differ', () {
        expect(() => [1, 2, 3].shouldContainSame([1, 2, 4]), failsTest);
        expect(() => [1, 2, 3].shouldEqualUnordered([1, 2, 4]), failsTest);
      });

      test('shouldNotContainSame passes when different', () {
        expect(
            () => [1, 2, 3].shouldNotContainSame([1, 2, 4]), returnsNormally);
        expect(() => [1, 2, 3].shouldNotEqualUnordered([1, 2, 4]),
            returnsNormally);
      });

      test('shouldNotContainSame fails when same', () {
        expect(() => [1, 2, 3].shouldNotContainSame([3, 2, 1]), failsTest);
      });
    });

    group('shouldBeSorted / shouldNotBeSorted', () {
      test('shouldBeSorted passes for naturally ascending iterables', () {
        expect(() => [1, 2, 3, 4].shouldBeSorted(), returnsNormally);
        expect(() => ['a', 'b', 'c'].shouldBeSorted(), returnsNormally);
      });

      test('shouldBeSorted fails when unsorted', () {
        expect(() => [1, 3, 2].shouldBeSorted(), failsTest);
      });

      test('shouldBeSortedAccordingTo with custom comparator', () {
        expect(
          () =>
              [4, 3, 2, 1].shouldBeSortedAccordingTo((a, b) => b.compareTo(a)),
          returnsNormally,
        );
      });

      test('shouldNotBeSorted passes when not sorted', () {
        expect(() => [1, 3, 2].shouldNotBeSorted(), returnsNormally);
      });

      test('shouldNotBeSorted fails when sorted', () {
        expect(() => [1, 2, 3].shouldNotBeSorted(), failsTest);
      });
    });

    group('shouldNotContainAll', () {
      test('passes when some element is missing', () {
        expect(() => [1, 2, 3].shouldNotContainAll([3, 4]), returnsNormally);
      });

      test('fails when all elements are present', () {
        expect(() => [1, 2, 3].shouldNotContainAll([1, 2]), failsTest);
      });
    });

    group('predicate aliases', () {
      test('shouldContainSome / shouldMatchAtLeastOneOf', () {
        expect(
            () => [1, 2, 3].shouldContainSome((x) => x > 2), returnsNormally);
        expect(() => [1, 2, 3].shouldMatchAtLeastOneOf((x) => x == 2),
            returnsNormally);
        expect(() => [1, 2, 3].shouldContainSome((x) => x > 5), failsTest);
      });

      test('shouldMatchAllWith', () {
        expect(() => [2, 4, 6].shouldMatchAllWith((x) => x.isEven),
            returnsNormally);
        expect(() => [2, 3, 6].shouldMatchAllWith((x) => x.isEven), failsTest);
      });

      test('shouldHaveCount', () {
        expect(() => [1, 2].shouldHaveCount(2), returnsNormally);
        expect(() => [1, 2].shouldHaveCount(3), failsTest);
      });
    });

    test('supports fluid chaining', () {
      expect(
        () => [1, 2, 3]
            .shouldNotBeEmpty()
            .shouldHaveSize(3)
            .shouldContain(2)
            .shouldBeSorted()
            .shouldContainSame([3, 2, 1]),
        returnsNormally,
      );
    });
  });
}
