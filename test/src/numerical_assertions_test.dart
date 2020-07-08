import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import 'matchers.dart';

void main() {
  group('greater or equal', () {
    test('should return normally when greater', () {
      expect(
        () => 2.shouldBeGreaterOrEqualTo(1),
        returnsNormally,
      );

      expect(
        () => 2.000000001.shouldBeGreaterOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should return normally when equal', () {
      expect(
        () => 2.shouldBeGreaterOrEqualTo(2),
        returnsNormally,
      );

      expect(
        () => 2.0.shouldBeGreaterOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should fail when smaller', () {
      expect(
        () => 1.shouldBeGreaterOrEqualTo(2),
        failsTest,
      );

      expect(
        () => 1.99999999.shouldBeGreaterOrEqualTo(2),
        failsTest,
      );
    });
  });

  group('greater', () {
    test('should return normally when greater', () {
      expect(
        () => 2.shouldBeGreaterThan(1),
        returnsNormally,
      );

      expect(
        () => 2.000000001.shouldBeGreaterThan(2),
        returnsNormally,
      );
    });

    test('should fail when equal', () {
      expect(
        () => 2.shouldBeGreaterThan(2),
        failsTest,
      );

      expect(
        () => 2.0.shouldBeGreaterThan(2),
        failsTest,
      );
    });

    test('should fail when smaller', () {
      expect(
        () => 1.shouldBeGreaterThan(2),
        failsTest,
      );

      expect(
        () => 1.99999999.shouldBeGreaterThan(2),
        failsTest,
      );
    });
  });

  group('less or equal', () {
    test('should return normally when less', () {
      expect(
        () => 1.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );

      expect(
        () => 1.999999999.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should return normally when equal', () {
      expect(
        () => 2.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );

      expect(
        () => 2.0.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should fail when greater', () {
      expect(
        () => 2.shouldBeLessOrEqualTo(1),
        failsTest,
      );

      expect(
        () => 2.00000001.shouldBeLessOrEqualTo(2),
        failsTest,
      );
    });
  });

  group('less', () {
    test('should return normally when less', () {
      expect(
        () => 1.shouldBeLessThan(2),
        returnsNormally,
      );

      expect(
        () => 1.999999999.shouldBeLessThan(2),
        returnsNormally,
      );
    });

    test('should fail when equal', () {
      expect(
        () => 2.shouldBeLessThan(2),
        failsTest,
      );

      expect(
        () => 2.0.shouldBeLessThan(2),
        failsTest,
      );
    });

    test('should fail when greater', () {
      expect(
        () => 2.shouldBeLessThan(1),
        failsTest,
      );

      expect(
        () => 2.00000001.shouldBeLessThan(2),
        failsTest,
      );
    });
  });

  group('positive', () {
    test('should return normally when positive', () {
      expect(
        () => 1.shouldBePositive(),
        returnsNormally,
      );

      expect(
        () => 0.000000001.shouldBePositive(),
        returnsNormally,
      );
    });

    test('should fail when zero', () {
      expect(
        () => 0.shouldBePositive(),
        failsTest,
      );
    });

    test('should fail when negative', () {
      expect(
        () => (-1).shouldBePositive(),
        failsTest,
      );

      expect(
        () => (-0.99999999).shouldBePositive(),
        failsTest,
      );
    });
  });

  group('negative', () {
    test('should return normally when negative', () {
      expect(
            () => (-1).shouldBeNegative(),
        returnsNormally,
      );

      expect(
            () => (-0.99999999).shouldBeNegative(),
        returnsNormally,
      );
    });

    test('should fail when zero', () {
      expect(
            () => 0.shouldBePositive(),
        failsTest,
      );
    });

    test('should fail when positive', () {
      expect(
            () => 1.shouldBeNegative(),
        failsTest,
      );

      expect(
            () => 0.000000001.shouldBeNegative(),
        failsTest,
      );
    });
  });
}
