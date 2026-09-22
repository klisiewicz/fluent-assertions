import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Extension methods for fluent assertions on [DateTime].
extension DateTimeAssertions on DateTime {
  /// Asserts that this [DateTime] is strictly after [expected].
  DateTime shouldBeAfter(DateTime expected) {
    checkExpect(
      isAfter(expected),
      isTrue,
      reason: 'Expected $this to be after $expected.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is not after [expected].
  DateTime shouldNotBeAfter(DateTime expected) {
    checkExpect(
      isAfter(expected),
      isFalse,
      reason: 'Expected $this to not be after $expected.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is strictly before [expected].
  DateTime shouldBeBefore(DateTime expected) {
    checkExpect(
      isBefore(expected),
      isTrue,
      reason: 'Expected $this to be before $expected.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is not before [expected].
  DateTime shouldNotBeBefore(DateTime expected) {
    checkExpect(
      isBefore(expected),
      isFalse,
      reason: 'Expected $this to not be before $expected.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is at the exact same moment as [expected].
  DateTime shouldBeAtSameMomentAs(DateTime expected) {
    checkExpect(
      isAtSameMomentAs(expected),
      isTrue,
      reason: 'Expected $this to be at the same moment as $expected.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is not at the exact same moment as [expected].
  DateTime shouldNotBeAtSameMomentAs(DateTime expected) {
    checkExpect(
      isAtSameMomentAs(expected),
      isFalse,
      reason: 'Expected $this to not be at the same moment as $expected.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is between [start] and [end] inclusive.
  DateTime shouldBeBetween(DateTime start, DateTime end) {
    final inRange = (isAtSameMomentAs(start) || isAfter(start)) &&
        (isAtSameMomentAs(end) || isBefore(end));
    checkExpect(
      inRange,
      isTrue,
      reason: 'Expected $this to be between $start and $end.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is outside the range [[start], [end]].
  DateTime shouldNotBeBetween(DateTime start, DateTime end) {
    final inRange = (isAtSameMomentAs(start) || isAfter(start)) &&
        (isAtSameMomentAs(end) || isBefore(end));
    checkExpect(
      inRange,
      isFalse,
      reason: 'Expected $this to not be between $start and $end.',
    );
    return this;
  }

  /// Asserts that the year of this [DateTime] equals [year].
  DateTime shouldBeInYear(int year) {
    checkExpect(
      this.year,
      equals(year),
      reason: 'Expected year to be $year, but was ${this.year}.',
    );
    return this;
  }

  /// Asserts that the month of this [DateTime] equals [month].
  DateTime shouldBeInMonth(int month) {
    checkExpect(
      this.month,
      equals(month),
      reason: 'Expected month to be $month, but was ${this.month}.',
    );
    return this;
  }

  /// Asserts that the day of this [DateTime] equals [day].
  DateTime shouldBeOnDay(int day) {
    checkExpect(
      this.day,
      equals(day),
      reason: 'Expected day to be $day, but was ${this.day}.',
    );
    return this;
  }

  /// Asserts that this [DateTime] has the same calendar date (year, month, day) as [expectedDate].
  DateTime shouldBeOnDate(DateTime expectedDate) {
    final sameDate = year == expectedDate.year &&
        month == expectedDate.month &&
        day == expectedDate.day;
    checkExpect(
      sameDate,
      isTrue,
      reason:
          'Expected date to be on ${expectedDate.year}-${expectedDate.month}-${expectedDate.day}, but was $year-$month-$day.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is within [delta] of [expected].
  DateTime shouldBeNear(DateTime expected, {Duration delta = Duration.zero}) {
    final diff = difference(expected).abs();
    checkExpect(
      diff <= delta,
      isTrue,
      reason:
          'Expected $this to be within $delta of $expected, but difference was $diff.',
    );
    return this;
  }

  /// Asserts that this [DateTime] is not within [delta] of [expected].
  DateTime shouldNotBeNear(DateTime expected,
      {Duration delta = Duration.zero}) {
    final diff = difference(expected).abs();
    checkExpect(
      diff <= delta,
      isFalse,
      reason:
          'Expected $this to not be within $delta of $expected, but difference was $diff.',
    );
    return this;
  }
}

/// Extension methods for fluent assertions on [Duration].
extension DurationAssertions on Duration {
  /// Asserts that this [Duration] is longer than [other].
  Duration shouldBeLongerThan(Duration other) {
    checkExpect(
      this > other,
      isTrue,
      reason: 'Expected $this to be longer than $other.',
    );
    return this;
  }

  /// Asserts that this [Duration] is shorter than [other].
  Duration shouldBeShorterThan(Duration other) {
    checkExpect(
      this < other,
      isTrue,
      reason: 'Expected $this to be shorter than $other.',
    );
    return this;
  }

  /// Asserts that this [Duration] is equal to [other].
  Duration shouldBeEqualTo(Duration other) {
    checkExpect(
      this,
      equals(other),
      reason: 'Expected $this to be equal to $other.',
    );
    return this;
  }

  /// Asserts that this [Duration] is not equal to [other].
  Duration shouldNotBeEqualTo(Duration other) {
    checkExpect(
      this,
      isNot(equals(other)),
      reason: 'Expected $this to not be equal to $other.',
    );
    return this;
  }

  /// Asserts that this [Duration] is positive (> 0).
  Duration shouldBePositive() {
    checkExpect(
      inMicroseconds > 0,
      isTrue,
      reason: 'Expected $this to be positive.',
    );
    return this;
  }

  /// Asserts that this [Duration] is non-positive (<= 0).
  Duration shouldNotBePositive() {
    checkExpect(
      inMicroseconds <= 0,
      isTrue,
      reason: 'Expected $this to not be positive.',
    );
    return this;
  }

  /// Asserts that this [Duration] is negative (< 0).
  Duration shouldBeNegative() {
    checkExpect(
      inMicroseconds < 0,
      isTrue,
      reason: 'Expected $this to be negative.',
    );
    return this;
  }

  /// Asserts that this [Duration] is non-negative (>= 0).
  Duration shouldNotBeNegative() {
    checkExpect(
      inMicroseconds >= 0,
      isTrue,
      reason: 'Expected $this to not be negative.',
    );
    return this;
  }

  /// Asserts that this [Duration] is zero.
  Duration shouldBeZero() {
    checkExpect(
      inMicroseconds == 0,
      isTrue,
      reason: 'Expected $this to be zero.',
    );
    return this;
  }

  /// Asserts that this [Duration] is not zero.
  Duration shouldNotBeZero() {
    checkExpect(
      inMicroseconds != 0,
      isTrue,
      reason: 'Expected $this to not be zero.',
    );
    return this;
  }
}
