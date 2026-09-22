import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Extension methods for assertions on [String].
extension StringAssertions on String {
  /// Asserts that the value is equal to [expected] ignoring case sensitivity.
  String shouldBeEqualToIgnoringCase(String expected) {
    checkExpect(this, equalsIgnoringCase(expected));
    return this;
  }

  /// Asserts that the value is not equal to [expected] ignoring case sensitivity.
  String shouldNotBeEqualToIgnoringCase(String expected) {
    checkExpect(this, isNot(equalsIgnoringCase(expected)));
    return this;
  }

  /// Asserts that the value starts with [expected] with case sensitivity.
  String shouldStartWith(String expected) {
    checkExpect(
      this,
      startsWith(expected),
      reason: 'Expected the String "$this" to start with "$expected"',
    );
    return this;
  }

  /// Asserts that the value does not start with [expected] with case sensitivity.
  String shouldNotStartWith(String expected) {
    checkExpect(
      this,
      isNot(startsWith(expected)),
      reason: 'Expected the String "$this" to not start with "$expected"',
    );
    return this;
  }

  /// Asserts that the value starts with [expected] ignoring case sensitivity.
  String shouldStartWithIgnoringCase(String expected) {
    checkExpect(
      toLowerCase(),
      startsWith(expected.toLowerCase()),
      reason: 'Expected the String "$this" to start with "$expected"',
    );
    return this;
  }

  /// Asserts that the value does not start with [expected] ignoring case sensitivity.
  String shouldNotStartWithIgnoringCase(String expected) {
    checkExpect(
      toLowerCase(),
      isNot(startsWith(expected.toLowerCase())),
      reason: 'Expected the String "$this" to not start with "$expected"',
    );
    return this;
  }

  /// Asserts that the value ends with [expected] with case sensitivity.
  String shouldEndWith(String expected) {
    checkExpect(
      this,
      endsWith(expected),
      reason: 'Expected the String "$this" to end with "$expected"',
    );
    return this;
  }

  /// Asserts that the value does not end with [expected] with case sensitivity.
  String shouldNotEndWith(String expected) {
    checkExpect(
      this,
      isNot(endsWith(expected)),
      reason: 'Expected the String "$this" to not end with "$expected"',
    );
    return this;
  }

  /// Asserts that the value ends with [expected] ignoring case sensitivity.
  String shouldEndWithIgnoringCase(String expected) {
    checkExpect(
      toLowerCase(),
      endsWith(expected.toLowerCase()),
      reason: 'Expected the String "$this" to end with "$expected"',
    );
    return this;
  }

  /// Asserts that the value does not end with [expected] ignoring case sensitivity.
  String shouldNotEndWithIgnoringCase(String expected) {
    checkExpect(
      toLowerCase(),
      isNot(endsWith(expected.toLowerCase())),
      reason: 'Expected the String "$this" to not end with "$expected"',
    );
    return this;
  }

  /// Asserts that the value contains [expected] with case sensitivity.
  String shouldContain(String expected) {
    checkExpect(
      this.contains(expected),
      isTrue,
      reason: 'Expected the String "$this" to contain "$expected"',
    );
    return this;
  }

  /// Asserts that the value does not contain [expected] with case sensitivity.
  String shouldNotContain(String expected) {
    checkExpect(
      this.contains(expected),
      isFalse,
      reason: 'Expected the String "$this" to not contain "$expected"',
    );
    return this;
  }

  /// Asserts that the value contains [expected] ignoring case sensitivity.
  String shouldContainIgnoringCase(String expected) {
    checkExpect(
      toLowerCase().contains(expected.toLowerCase()),
      isTrue,
      reason: 'Expected the String "$this" to contain "$expected"',
    );
    return this;
  }

  /// Asserts that the value does not contain [expected] ignoring case sensitivity.
  String shouldNotContainIgnoringCase(String expected) {
    checkExpect(
      toLowerCase().contains(expected.toLowerCase()),
      isFalse,
      reason: 'Expected the String "$this" to not contain "$expected"',
    );
    return this;
  }

  /// Asserts that the value contains every substring in [items] with case sensitivity.
  String shouldContainAll(Iterable<String> items) {
    for (final item in items) {
      checkExpect(
        this.contains(item),
        isTrue,
        reason:
            'Expected "$this" to contain all of $items, but missing "$item"',
      );
    }
    return this;
  }

  /// Asserts that the value does not contain all substrings in [items] with case sensitivity.
  String shouldNotContainAll(Iterable<String> items) {
    final containsAll = items.every((item) => this.contains(item));
    checkExpect(
      containsAll,
      isFalse,
      reason: 'Expected "$this" to not contain all of $items',
    );
    return this;
  }

  /// Asserts that the value contains every substring in [items] ignoring case sensitivity.
  String shouldContainAllIgnoringCase(Iterable<String> items) {
    final lower = toLowerCase();
    for (final item in items) {
      checkExpect(
        lower.contains(item.toLowerCase()),
        isTrue,
        reason:
            'Expected "$this" to contain all of $items ignoring case, but missing "$item"',
      );
    }
    return this;
  }

  /// Asserts that the value does not contain all substrings in [items] ignoring case sensitivity.
  String shouldNotContainAllIgnoringCase(Iterable<String> items) {
    final lower = toLowerCase();
    final containsAll =
        items.every((item) => lower.contains(item.toLowerCase()));
    checkExpect(
      containsAll,
      isFalse,
      reason: 'Expected "$this" to not contain all of $items ignoring case',
    );
    return this;
  }

  /// Asserts that the value contains [items] in relative order with case sensitivity.
  String shouldContainAllInOrder(List<String> items) {
    checkExpect(
      this,
      stringContainsInOrder(items),
      reason: 'Expected "$this" to contain all of $items in order',
    );
    return this;
  }

  /// Asserts that the value contains [items] in relative order ignoring case sensitivity.
  String shouldContainAllInOrderIgnoringCase(List<String> items) {
    checkExpect(
      toLowerCase(),
      stringContainsInOrder(items.map((item) => item.toLowerCase()).toList()),
      reason:
          'Expected "$this" to contain all of $items in order ignoring case',
    );
    return this;
  }

  /// Asserts that the value contains at least one of [items] with case sensitivity.
  String shouldContainAny(Iterable<String> items) {
    final hasAny = items.any((item) => this.contains(item));
    checkExpect(
      hasAny,
      isTrue,
      reason: 'Expected "$this" to contain any of $items, but none were found',
    );
    return this;
  }

  /// Asserts that the value contains none of [items] with case sensitivity.
  String shouldContainNone(Iterable<String> items) {
    final hasAny = items.any((item) => this.contains(item));
    checkExpect(
      hasAny,
      isFalse,
      reason: 'Expected "$this" to contain none of $items, but some were found',
    );
    return this;
  }

  /// Asserts that the value contains at least one of [items] ignoring case sensitivity.
  String shouldContainAnyIgnoringCase(Iterable<String> items) {
    final lower = toLowerCase();
    final hasAny = items.any((item) => lower.contains(item.toLowerCase()));
    checkExpect(
      hasAny,
      isTrue,
      reason:
          'Expected "$this" to contain any of $items ignoring case, but none were found',
    );
    return this;
  }

  /// Asserts that the value contains none of [items] ignoring case sensitivity.
  String shouldContainNoneIgnoringCase(Iterable<String> items) {
    final lower = toLowerCase();
    final hasAny = items.any((item) => lower.contains(item.toLowerCase()));
    checkExpect(
      hasAny,
      isFalse,
      reason:
          'Expected "$this" to contain none of $items ignoring case, but some were found',
    );
    return this;
  }

  /// Asserts that the value matches the regular expression given by [regExp].
  String shouldMatch(Pattern regExp) {
    checkExpect(
      this,
      matches(regExp),
      reason: 'Expected "$this" to match $regExp',
    );
    return this;
  }

  /// Asserts that the value does not match the regular expression given by [regExp].
  String shouldNotMatch(Pattern regExp) {
    checkExpect(
      this,
      isNot(matches(regExp)),
      reason: 'Expected "$this" to not match $regExp',
    );
    return this;
  }

  /// Asserts that the string is empty.
  String shouldBeEmpty() {
    checkExpect(
      this.isEmpty,
      isTrue,
      reason: 'Expected String to be empty, but was "$this"',
    );
    return this;
  }

  /// Asserts that the string is not empty.
  String shouldNotBeEmpty() {
    checkExpect(
      this.isNotEmpty,
      isTrue,
      reason: 'Expected String to not be empty, but was empty',
    );
    return this;
  }

  /// Asserts that the string consists only of whitespace characters or is empty.
  String shouldBeBlank() {
    checkExpect(
      trim().isEmpty,
      isTrue,
      reason: 'Expected String to be blank, but was "$this"',
    );
    return this;
  }

  /// Asserts that the string is not blank.
  String shouldNotBeBlank() {
    checkExpect(
      trim().isNotEmpty,
      isTrue,
      reason: 'Expected String to not be blank, but was "$this"',
    );
    return this;
  }

  /// Asserts that the string has the expected character [length].
  String shouldHaveLength(int expectedLength) {
    checkExpect(
      length,
      equals(expectedLength),
      reason:
          'Expected String to have length $expectedLength, but was $length ("$this")',
    );
    return this;
  }

  /// Asserts that the string can be parsed as a number.
  String shouldBeNumeric() {
    checkExpect(
      num.tryParse(this) != null,
      isTrue,
      reason:
          'Expected "$this" to be numeric, but could not be parsed as a number',
    );
    return this;
  }

  /// Asserts that the string cannot be parsed as a number.
  String shouldNotBeNumeric() {
    checkExpect(
      num.tryParse(this) == null,
      isTrue,
      reason: 'Expected "$this" to not be numeric, but was parsed as a number',
    );
    return this;
  }
}

/// Extension methods for assertions on nullable [String]s.
extension StringNullableAssertions on String? {
  /// Asserts that the value is null or empty.
  String? shouldBeNullOrEmpty() {
    checkExpect(
      this?.isEmpty ?? true,
      isTrue,
      reason: 'Expected String to be null or empty, but was "$this"',
    );
    return this;
  }

  /// Asserts that the value is neither null nor empty.
  String? shouldNotBeNullOrEmpty() {
    checkExpect(
      this?.isNotEmpty ?? false,
      isTrue,
      reason: 'Expected String to not be null or empty, but was "$this"',
    );
    return this;
  }

  /// Asserts that the value is null or blank.
  String? shouldBeNullOrBlank() {
    checkExpect(
      this?.trim().isEmpty ?? true,
      isTrue,
      reason: 'Expected String to be blank or null, but was "$this"',
    );
    return this;
  }

  /// Asserts that the value is neither null nor blank.
  String? shouldNotBeNullOrBlank() {
    checkExpect(
      this?.trim().isNotEmpty ?? false,
      isTrue,
      reason: 'Expected String to not be blank or null, but was "$this"',
    );
    return this;
  }
}
