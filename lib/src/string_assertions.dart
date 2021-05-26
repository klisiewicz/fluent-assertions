import 'package:test/test.dart';

extension StringAssertions on String {
  void shouldBeEqualTo(String expected) {
    expect(this, equals(expected));
  }

  void shouldNotBeEqualTo(String expected) {
    expect(this, isNot(equals(expected)));
  }

  void shouldBeEqualToIgnoringCase(String expected) {
    expect(this, equalsIgnoringCase(expected));
  }

  void shouldNotBeEqualToIgnoringCase(String expected) {
    expect(this, isNot(equalsIgnoringCase(expected)));
  }

  void shouldStartWith(String expected) {
    expect(
      this,
      startsWith(expected),
      reason: 'Expected the String $this to start with $expected',
    );
  }

  void shouldNotStartWith(String expected) {
    expect(
      this,
      isNot(startsWith(expected)),
      reason: 'Expected the String $this to not start with $expected',
    );
  }

  void shouldStartWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      startsWith(expected.toLowerCase()),
      reason: 'Expected the String $this to start with $expected',
    );
  }

  void shouldNotStartWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      isNot(startsWith(expected.toLowerCase())),
      reason: 'Expected the String $this to not start with $expected',
    );
  }

  void shouldEndWith(String expected) {
    expect(
      this,
      endsWith(expected),
      reason: 'Expected the String $this to end with $expected',
    );
  }

  void shouldNotEndWith(String expected) {
    expect(
      this,
      isNot(endsWith(expected)),
      reason: 'Expected the String $this to not to end with $expected',
    );
  }

  void shouldEndWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      endsWith(expected.toLowerCase()),
      reason: 'Expected the String $this to end with $expected',
    );
  }

  void shouldNotEndWithIgnoringCase(String expected) {
    expect(
      toLowerCase(),
      isNot(endsWith(expected.toLowerCase())),
      reason: 'Expected the String $this to not to end with $expected',
    );
  }

  void shouldContain(String expected) {
    expect(
      this.contains(expected),
      isTrue,
      reason: 'Expected the String $this to contain $expected',
    );
  }

  void shouldNotContain(String expected) {
    expect(
      this.contains(expected),
      isFalse,
      reason: 'Expected the String $this to not to contain $expected',
    );
  }

  void shouldContainIgnoringCase(String expected) {
    expect(
      toLowerCase().contains(expected.toLowerCase()),
      isTrue,
      reason: 'Expected the String $this to contain $expected',
    );
  }

  void shouldNotContainIgnoringCase(String expected) {
    expect(
      toLowerCase().contains(expected.toLowerCase()),
      isFalse,
      reason: 'Expected the String $this to not to contain $expected',
    );
  }

  void shouldContainAll(Iterable<String> items) {
    expect(
      split(''),
      containsAll(items),
      reason: 'Expected $this to contain all of $items',
    );
  }

  void shouldContainAllIgnoringCase(Iterable<String> items) {
    expect(
      toLowerCase().split(''),
      containsAll(items.map((item) => item.toLowerCase())),
      reason: 'Expected $this to contain all of $items',
    );
  }

  void shouldContainAllInOrder(List<String> items) {
    expect(
      this,
      stringContainsInOrder(items),
      reason: 'Expected $this to contain all of $items',
    );
  }

  void shouldMatch(dynamic regExp) {
    expect(
      this,
      matches(regExp),
      reason: 'Expected $this to match $regExp',
    );
  }

  void shouldNotMatch(dynamic regExp) {
    expect(
      this,
      isNot(matches(regExp)),
      reason: 'Expected $this to not to match $regExp',
    );
  }

  void shouldBeEmpty() {
    expect(
      this.isEmpty,
      isTrue,
      reason: 'Expected String to be empty, but was $this',
    );
  }

  void shouldNotBeEmpty() {
    expect(
      this.isNotEmpty,
      isTrue,
      reason: 'Expected String to not to be empty, but was $this',
    );
  }

  void shouldBeBlank() {
    expect(
      trim().isEmpty,
      isTrue,
      reason: 'Expected String to be blank, but was $this',
    );
  }

  void shouldNotBeBlank() {
    expect(
      trim().isNotEmpty,
      isTrue,
      reason: 'Expected String to not to be blank, but was $this',
    );
  }
}

extension StringNullableAssertions on String? {
  void shouldBeNullOrEmpty() {
    expect(
      this?.isEmpty ?? true,
      isTrue,
      reason: 'Expected String to be null or empty, but was $this',
    );
  }

  void shouldNotBeNullOrEmpty() {
    expect(
      this?.isNotEmpty ?? false,
      isTrue,
      reason: 'Expected String to not to be null or empty, but was $this',
    );
  }

  void shouldBeNullOrBlank() {
    expect(
      this?.trim().isEmpty ?? true,
      isTrue,
      reason: 'Expected String to be blank or null, but was $this',
    );
  }

  void shouldNotBeNullOrBlank() {
    expect(
      this?.trim().isNotEmpty ?? false,
      isTrue,
      reason: 'Expected String to not to be blank or null, but was $this',
    );
  }
}
