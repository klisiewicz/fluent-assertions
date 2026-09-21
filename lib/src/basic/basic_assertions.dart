import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Extension methods for general assertions on any object or null.
extension BaseAssertions<T> on T? {
  /// Asserts that the value is structurally equal to [expected].
  @Deprecated('Use `shouldBeEqualTo` instead.')
  T? shouldEqual(T expected) => shouldBeEqualTo(expected);

  /// Asserts that the value is structurally equal to [expected].
  T? shouldBeEqualTo(T expected) {
    checkExpect(this, equals(expected));
    return this;
  }

  /// Asserts that the value is structurally different from [expected].
  @Deprecated('Use `shouldNotBeEqualTo` instead.')
  T? shouldNotEqual(T expected) => shouldNotBeEqualTo(expected);

  /// Asserts that the value is structurally different from [expected].
  T? shouldNotBeEqualTo(T expected) {
    checkExpect(this, isNot(equals(expected)));
    return this;
  }

  /// Asserts that the value is the same instance as [expected], using [identical].
  T? shouldBe(T expected) {
    checkExpect(this, same(expected));
    return this;
  }

  /// Asserts that the value is not the same instance as [expected], using [identical].
  T? shouldNotBe(T expected) {
    checkExpect(this, isNot(same(expected)));
    return this;
  }

  /// Asserts that the value is null.
  T? shouldBeNull() {
    checkExpect(this, isNull);
    return this;
  }

  /// Asserts that the value is non-null and returns the non-nullable value.
  T shouldNotBeNull() {
    expect(
      this,
      isNotNull,
      reason: 'Expected value to not be null, but was null.',
    );
    return this!;
  }

  /// Asserts that the value is of type [E].
  /// [E] - Expected type.
  T? shouldBeInstanceOf<E>() {
    checkExpect(this, isA<E>());
    return this;
  }

  /// Asserts that the value is not of type [E].
  /// [E] - Expected type.
  T? shouldNotBeInstanceOf<E>() {
    checkExpect(this, isNot(isA<E>()));
    return this;
  }

  /// Asserts that the value has the same runtime class/type as [other].
  T? shouldHaveTheSameClassAs(Object other) {
    checkExpect(
      this?.runtimeType,
      equals(other.runtimeType),
      reason: 'Expected $this to have the same class as $other.',
    );
    return this;
  }

  /// Asserts that the value does not have the same runtime class/type as [other].
  T? shouldNotHaveTheSameClassAs(Object other) {
    checkExpect(
      this?.runtimeType,
      isNot(equals(other.runtimeType)),
      reason: 'Expected $this to not have the same class as $other.',
    );
    return this;
  }

  /// Asserts that this element is present in [container].
  T? shouldBeIn(Iterable<T> container) {
    checkExpect(
      container,
      contains(this),
      reason: 'Expected $this to be in $container, but it was not.',
    );
    return this;
  }

  /// Asserts that this element is not present in [container].
  T? shouldNotBeIn(Iterable<T> container) {
    checkExpect(
      container,
      isNot(contains(this)),
      reason: 'Expected $this to not be in $container, but it was.',
    );
    return this;
  }
}

/// Extension methods for boolean assertions.
extension BoolAssertions on bool {
  /// Asserts that the value is true.
  bool shouldBeTrue() {
    checkExpect(this, isTrue);
    return this;
  }

  /// Asserts that the value is not false (i.e. is true).
  bool shouldNotBeFalse() {
    checkExpect(this, isNot(isFalse));
    return this;
  }

  /// Asserts that the value is false.
  bool shouldBeFalse() {
    checkExpect(this, isFalse);
    return this;
  }

  /// Asserts that the value is not true (i.e. is false).
  bool shouldNotBeTrue() {
    checkExpect(this, isNot(isTrue));
    return this;
  }
}

/// Extension methods for checking single character digits.
extension CharDigitAssertions on String {
  /// Asserts that the character is a digit ('0'-'9').
  String shouldBeDigit() {
    checkExpect(
      length == 1 && RegExp(r'^[0-9]$').hasMatch(this),
      isTrue,
      reason: 'Expected "$this" to be a digit, but it was not.',
    );
    return this;
  }

  /// Asserts that the character is not a digit.
  String shouldNotBeDigit() {
    checkExpect(
      length == 1 && RegExp(r'^[0-9]$').hasMatch(this),
      isFalse,
      reason: 'Expected "$this" to not be a digit, but it was.',
    );
    return this;
  }
}
