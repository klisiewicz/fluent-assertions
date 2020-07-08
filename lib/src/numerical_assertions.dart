import 'package:test/test.dart';

extension NumericalAssertions on num {
  /// Asserts that the value is greater or equal to [expected].
  void shouldBeGreaterOrEqualTo(num expected) =>
      expect(this >= expected, isTrue);

  /// Asserts that the value is not greater or equal to [expected].
  void shouldNotBeGreaterOrEqualTo(num expected) => shouldBeLessThan(expected);

  /// Asserts that the value is greater than [expected].
  void shouldBeGreaterThan(num expected) => expect(this > expected, isTrue);

  /// Asserts that the value is not greater than [expected].
  void shouldNotBeGreaterThan(num expected) => shouldBeLessOrEqualTo(expected);

  /// Asserts that the value is less or equal to [expected].
  void shouldBeLessOrEqualTo(num expected) => expect(this <= expected, isTrue);

  /// Asserts that the value is not less or equal to [expected].
  void shouldNotBeLessOrEqualTo(num expected) => shouldBeGreaterThan(expected);

  /// Asserts that the value is less than [expected].
  void shouldBeLessThan(num expected) => expect(this < expected, isTrue);

  /// Asserts that the value is not less than [expected].
  void shouldNotBeLessThan(num expected) => shouldBeGreaterOrEqualTo(expected);

  /// Asserts that the value is greater than zero.
  void shouldBePositive() => expect(this > 0, isTrue);

  /// Asserts that the value is less than zero.
  void shouldBeNegative() => expect(this < 0, isTrue);
}
