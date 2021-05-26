import 'package:test/test.dart';

extension StringAssertions on String {
  /// Asserts that the value is equal to [expected] ignoring case sensitivity.
  void shouldBeEqualToIgnoringCase(String expected) {
    expect(this, equalsIgnoringCase(expected));
  }

  /// Asserts that the value is not equal to [expected] ignoring
  /// case sensitivity.
  void shouldNotBeEqualToIgnoringCase(String expected) {
    expect(this, isNot(equalsIgnoringCase(expected)));
  }

  /// Asserts that the value starts with [expected] with case sensitivity.
  void shouldStartWith(String expected) {
    expect(
      this,
      startsWith(expected),
      reason: 'Expected the String $this to start with $expected',
    );
  }

  /// Asserts that the value doesn't starts with [expected]
  /// with case sensitivity.
  void shouldNotStartWith(String expected) {
    expect(
      this,
      isNot(startsWith(expected)),
      reason: 'Expected the String $this to not start with $expected',
    );
  }

  /// Asserts that the value starts with [expected] ignoring case sensitivity.
  void shouldStartWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      startsWith(expected.toLowerCase()),
      reason: 'Expected the String $this to start with $expected',
    );
  }

  /// Asserts that the value doesn't starts with [expected]
  /// ignoring case sensitivity.
  void shouldNotStartWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      isNot(startsWith(expected.toLowerCase())),
      reason: 'Expected the String $this to not start with $expected',
    );
  }

  /// Asserts that the value ends with [expected] with case sensitivity.
  void shouldEndWith(String expected) {
    expect(
      this,
      endsWith(expected),
      reason: 'Expected the String $this to end with $expected',
    );
  }

  /// Asserts that the value doesn't end with [expected] with case sensitivity.
  void shouldNotEndWith(String expected) {
    expect(
      this,
      isNot(endsWith(expected)),
      reason: 'Expected the String $this to not to end with $expected',
    );
  }

  /// Asserts that the value ends with [expected] ignoring case sensitivity.
  void shouldEndWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      endsWith(expected.toLowerCase()),
      reason: 'Expected the String $this to end with $expected',
    );
  }

  /// Asserts that the value doesn't end with [expected]
  /// ignoring case sensitivity.
  void shouldNotEndWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      isNot(endsWith(expected.toLowerCase())),
      reason: 'Expected the String $this to not to end with $expected',
    );
  }

  /// Asserts that the value contains [expected] with case sensitivity.
  void shouldContain(String expected) {
    expect(
      this.contains(expected),
      isTrue,
      reason: 'Expected the String $this to contain $expected',
    );
  }

  /// Asserts that the value does not contain [expected] with case sensitivity.
  void shouldNotContain(String expected) {
    expect(
      this.contains(expected),
      isFalse,
      reason: 'Expected the String $this to not to contain $expected',
    );
  }

  /// Asserts that the value contains [expected] ignoring case sensitivity.
  void shouldContainIgnoringCase(String expected) {
    expect(
      toLowerCase().contains(expected.toLowerCase()),
      isTrue,
      reason: 'Expected the String $this to contain $expected',
    );
  }

  /// Asserts that the value doesn't contain [expected]
  /// ignoring case sensitivity.
  void shouldNotContainIgnoringCase(String expected) {
    expect(
      toLowerCase().contains(expected.toLowerCase()),
      isFalse,
      reason: 'Expected the String $this to not to contain $expected',
    );
  }

  /// Asserts that the value contains a list of [items] in any order
  /// with case sensitivity.
  void shouldContainAll(Iterable<String> items) {
    expect(
      split(''),
      containsAll(items),
      reason: 'Expected $this to contain all of $items',
    );
  }

  /// Asserts that the value contains a list of [items] in any order
  /// ignoring case sensitivity.
  void shouldContainAllIgnoringCase(Iterable<String> items) {
    expect(
      toLowerCase().split(''),
      containsAll(items.map((item) => item.toLowerCase())),
      reason: 'Expected $this to contain all of $items',
    );
  }

  /// Asserts that the value contains a list of [items] in relative order
  /// with case sensitivity.
  void shouldContainAllInOrder(List<String> items) {
    expect(
      this,
      stringContainsInOrder(items),
      reason: 'Expected $this to contain all of $items',
    );
  }

  /// Asserts that the value contains a list of [items] in relative order
  /// ignoring case sensitivity.
  void shouldContainAllInOrderIgnoringCase(List<String> items) {
    expect(
      toLowerCase(),
      stringContainsInOrder(items.map((item) => item.toLowerCase()).toList()),
      reason: 'Expected $this to contain all of $items',
    );
  }

  /// Asserts that the value matches the regular expression given by [regExp].
  /// [regExp] can be a [RegExp] instance or a [String].
  void shouldMatch(dynamic regExp) {
    expect(
      this,
      matches(regExp),
      reason: 'Expected $this to match $regExp',
    );
  }

  /// Asserts that the value does not match the regular expression \
  /// given by [regExp].
  /// [regExp] can be a [RegExp] instance or a [String].
  void shouldNotMatch(dynamic regExp) {
    expect(
      this,
      isNot(matches(regExp)),
      reason: 'Expected $this to not to match $regExp',
    );
  }

  /// Asserts that the value is empty.
  void shouldBeEmpty() {
    expect(
      this.isEmpty,
      isTrue,
      reason: 'Expected String to be empty, but was $this',
    );
  }

  /// Asserts that the value is not empty.
  void shouldNotBeEmpty() {
    expect(
      this.isNotEmpty,
      isTrue,
      reason: 'Expected String to not to be empty, but was $this',
    );
  }

  /// Asserts that the value is blank.
  void shouldBeBlank() {
    expect(
      trim().isEmpty,
      isTrue,
      reason: 'Expected String to be blank, but was $this',
    );
  }

  /// Asserts that the value is not blank.
  void shouldNotBeBlank() {
    expect(
      trim().isNotEmpty,
      isTrue,
      reason: 'Expected String to not to be blank, but was $this',
    );
  }
}

extension StringNullableAssertions on String? {
  /// Asserts that the value is null or empty.
  void shouldBeNullOrEmpty() {
    expect(
      this?.isEmpty ?? true,
      isTrue,
      reason: 'Expected String to be null or empty, but was $this',
    );
  }

  /// Asserts that the value is not null nor empty.
  void shouldNotBeNullOrEmpty() {
    expect(
      this?.isNotEmpty ?? false,
      isTrue,
      reason: 'Expected String to not to be null or empty, but was $this',
    );
  }

  /// Asserts that the value is null or blank.
  void shouldBeNullOrBlank() {
    expect(
      this?.trim().isEmpty ?? true,
      isTrue,
      reason: 'Expected String to be blank or null, but was $this',
    );
  }

  /// Asserts that the value is not null nor blank.
  void shouldNotBeNullOrBlank() {
    expect(
      this?.trim().isNotEmpty ?? false,
      isTrue,
      reason: 'Expected String to not to be blank or null, but was $this',
    );
  }
}
