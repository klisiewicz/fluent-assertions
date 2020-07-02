import 'package:test/test.dart';
import 'package:fluent_assertions/fluent_assertions.dart';

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
            () => 1.99999999.shouldBeGreaterOrEqualTo(2),
        failsTest,
      );
    });
  });
}
