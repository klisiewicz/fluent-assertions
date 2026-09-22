import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Extension methods for numerical assertions on [num], [int], and [double].
extension NumericalAssertions<T extends num> on T {
  /// Asserts that the value is greater or equal to [expected].
  T shouldBeGreaterOrEqualTo(num expected) {
    checkExpect(this, greaterThanOrEqualTo(expected));
    return this;
  }

  /// Asserts that the value is not greater or equal to [expected].
  T shouldNotBeGreaterOrEqualTo(num expected) {
    shouldBeLessThan(expected);
    return this;
  }

  /// Asserts that the value is greater than [expected].
  T shouldBeGreaterThan(num expected) {
    checkExpect(this, greaterThan(expected));
    return this;
  }

  /// Asserts that the value is not greater than [expected].
  T shouldNotBeGreaterThan(num expected) {
    shouldBeLessOrEqualTo(expected);
    return this;
  }

  /// Asserts that the value is less or equal to [expected].
  T shouldBeLessOrEqualTo(num expected) {
    checkExpect(this, lessThanOrEqualTo(expected));
    return this;
  }

  /// Asserts that the value is not less or equal to [expected].
  T shouldNotBeLessOrEqualTo(num expected) {
    shouldBeGreaterThan(expected);
    return this;
  }

  /// Asserts that the value is less than [expected].
  T shouldBeLessThan(num expected) {
    checkExpect(this, lessThan(expected));
    return this;
  }

  /// Asserts that the value is not less than [expected].
  T shouldNotBeLessThan(num expected) {
    shouldBeGreaterOrEqualTo(expected);
    return this;
  }

  /// Asserts that the value is greater than zero.
  T shouldBePositive() {
    checkExpect(this, isPositive);
    return this;
  }

  /// Asserts that the value is less or equal to zero.
  T shouldNotBePositive() {
    checkExpect(this, isNonPositive);
    return this;
  }

  /// Asserts that the value is less than zero.
  T shouldBeNegative() {
    checkExpect(this, isNegative);
    return this;
  }

  /// Asserts that the value is greater or equal to zero.
  T shouldNotBeNegative() {
    checkExpect(this, isNonNegative);
    return this;
  }

  /// Asserts that the value is zero.
  T shouldBeZero() {
    checkExpect(this, isZero);
    return this;
  }

  /// Asserts that the value is not zero.
  T shouldNotBeZero() {
    checkExpect(this, isNonZero);
    return this;
  }

  /// Asserts that the value is within [delta] of [expected].
  ///
  /// Conforming with Kluent parity, [double.nan] is considered near itself.
  T shouldBeNear(num expected, {num delta = 0}) {
    if (this.isNaN && expected.isNaN) {
      return this;
    }
    if (this.isNaN || expected.isNaN) {
      checkExpect(
        false,
        isTrue,
        reason: 'Expected $this to be near $expected +/- $delta.',
      );
      return this;
    }
    checkExpect(this, closeTo(expected, delta));
    return this;
  }

  /// Asserts that the value is not within [delta] of [expected].
  T shouldNotBeNear(num expected, {num delta = 0}) {
    if (this.isNaN && expected.isNaN) {
      checkExpect(
        false,
        isTrue,
        reason: 'Expected NaN not to be near NaN +/- $delta.',
      );
      return this;
    }
    if (this.isNaN || expected.isNaN) {
      return this;
    }
    checkExpect(this, isNot(closeTo(expected, delta)));
    return this;
  }

  /// Asserts that the value is greater than or equal to [lowerBound]
  /// and less than or equal to [upperBound].
  T shouldBeInRange({
    num lowerBound = double.negativeInfinity,
    num upperBound = double.infinity,
  }) {
    checkExpect(this, inInclusiveRange(lowerBound, upperBound));
    return this;
  }

  /// Asserts that the value is outside the range [[lowerBound], [upperBound]].
  T shouldNotBeInRange({
    num lowerBound = double.negativeInfinity,
    num upperBound = double.infinity,
  }) {
    checkExpect(this, isNot(inInclusiveRange(lowerBound, upperBound)));
    return this;
  }
}
