import 'package:test/test.dart';

extension NumericalAssertions on num {
  /// Asserts that the value is greater or equal to [expected].
  void shouldBeGreaterOrEqualTo(num expected) =>
      expect(this >= expected, isTrue);

  /// Asserts that the value is greater than [expected].
  void shouldBeGreaterThan(num expected) =>
      expect(this > expected, isTrue);

  /// Asserts that the value is less or equal to [expected].
  void shouldBeLessOrEqualTo(num expected) =>
      expect(this <= expected, isTrue);

  /// Asserts that the value is less than [expected].
  void shouldBeLessThan(num expected) =>
      expect(this < expected, isTrue);
}
