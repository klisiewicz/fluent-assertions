import 'package:fluent_assertions/src/iterable/iterable_matchers.dart';
import 'package:test/test.dart';

extension IterableObjectAssertions on Iterable<Object> {
  /// Asserts that every value in [Iterable] is of type [E].
  /// [E] - Expected type.
  void shouldAllBeInstanceOf<E>() {
    expect(
      this,
      everyElement((e) => e is E),
      reason: 'Expected all elements to be instances of $E, but some were not.',
    );
  }

  /// Asserts that any value in [Iterable] is of type [E].
  /// [E] - Expected type.
  void shouldAnyBeInstanceOf<E>() {
    expect(
      this,
      anyElement((e) => e is E),
      reason:
          'Expected at least one element to be an instance of $E, but none were.',
    );
  }

  /// Asserts that every value in [Iterable] is not of type [E].
  /// [E] - Expected type.
  void shouldNoneBeInstanceOf<E>() {
    expect(
      this,
      everyElement((e) => e is! E),
      reason: 'Expected no elements to be instances of $E, but some were.',
    );
  }
}

extension IterableAssertions<T> on Iterable<T> {
  /// Asserts that [Iterable] has [expectedSize] elements
  void shouldHaveSize(int expectedSize) {
    expect(
      this,
      hasLength(expectedSize),
      reason:
          'Expected iterable to have $expectedSize elements, but found $length.',
    );
  }

  /// Asserts that [Iterable] is empty.
  void shouldBeEmpty() {
    expect(
      this,
      isEmpty,
      reason: 'Expected iterable to be empty, but it was not.',
    );
  }

  /// Asserts that [Iterable] is not empty.
  void shouldNotBeEmpty() {
    expect(
      this,
      isNot(isEmpty),
      reason: 'Expected iterable to not be empty, but it was.',
    );
  }

  /// Asserts that [Iterable] has 1 element.
  void shouldHaveSingleItem() {
    expect(
      this,
      hasLength(1),
      reason: 'Expected iterable to have exactly one item, but has $length.',
    );
  }

  /// Asserts that [Iterable] contains [expected].
  void shouldContain(T? expected) {
    expect(
      this,
      contains(expected),
      reason: 'Expected iterable to contain $expected, but it did not.',
    );
  }

  /// Asserts that [Iterable] does not contain [expected].
  void shouldNotContain(T? expected) {
    expect(
      this,
      isNot(contains(expected)),
      reason: 'Expected iterable to not contain $expected, but it did.',
    );
  }

  /// Asserts that [Iterable] contains any of [expected].
  void shouldContainAny(Iterable<T> expected) {
    expect(
      this,
      containsAny(expected.map(equals).toList()),
      reason:
          'Expected at least one element from $expected to be present in $this.',
    );
  }

  /// Asserts that [Iterable] contains none of [expected].
  void shouldContainNone(Iterable<T> expected) {
    expect(
      this,
      isNot(containsAny(expected.map(equals).toList())),
      reason:
          'Expected iterable to contain none of $expected, but some were found.',
    );
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in any order, and may contain additional values.
  void shouldContainAll(Iterable<T> expected) {
    expect(
      this,
      containsAll(expected),
      reason:
          'Expected iterable to contain all of $expected, but some were missing.',
    );
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in the same order, but may contain additional values
  /// interleaved throughout.
  void shouldContainAllInOrder(Iterable<T> expected) {
    expect(
      this,
      containsAllInOrder(expected),
      reason:
          'Expected iterable to contain all of $expected in order, but it did not.',
    );
  }

  /// Asserts that [Iterable] contains an element matching the given [predicate].
  void shouldContainAnyThat(bool Function(T argument) predicate) {
    expect(
      this,
      anyElement(predicate),
      reason:
          'Expected iterable to contain at least one element matching the predicate, but none did.',
    );
  }

  /// Asserts that all [Iterable] elements match [predicate].
  void shouldContainAllThat(bool Function(T argument) predicate) {
    expect(
      this,
      everyElement(predicate),
      reason:
          'Expected every element in iterable to match the predicate, but some did not.',
    );
  }

  /// Asserts that none [Iterable] elements match [predicate].
  void shouldContainNoneThat(bool Function(T argument) predicate) {
    expect(
      this,
      everyElement(isNot(predicate)),
      reason:
          'Expected no elements in iterable to match the predicate, but some did.',
    );
  }
}

extension IterableStringAssertions on Iterable<String> {
  /// Asserts that [Iterable] contains [expected] case-insensitively.
  void shouldContainIgnoringCase(String expected) {
    expect(
      this,
      containsAll([equalsIgnoringCase(expected)]),
      reason:
          'Expected iterable to contain "$expected" ignoring case, but it did not.',
    );
  }

  /// Asserts that [Iterable] contains [expected] case-insensitively.
  void shouldNotContainIgnoringCase(String expected) {
    expect(
      this,
      isNot(containsAll([equalsIgnoringCase(expected)])),
      reason:
          'Expected iterable to not contain "$expected" ignoring case, but it did.',
    );
  }

  /// Asserts that [Iterable] contains any of [expected] case-insensitively.
  void shouldContainAnyIgnoringCase(Iterable<String> expected) {
    expect(
      this,
      containsAny(expected.map((e) => equalsIgnoringCase(e)).toList()),
      reason:
          'Expected iterable to contain any of $expected ignoring case, but none were found.',
    );
  }

  /// Asserts that [Iterable] contains none of [expected] case-insensitively.
  void shouldContainNoneIgnoringCase(Iterable<String> expected) {
    expect(
      this,
      isNot(containsAny(expected.map((e) => equalsIgnoringCase(e)).toList())),
      reason:
          'Expected iterable to contain none of $expected ignoring case, but some were found.',
    );
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in any order, case-insensitively, and may contain additional
  /// values.
  void shouldContainAllIgnoringCase(Iterable<String> expected) {
    expect(
      this,
      containsAll(expected.map((e) => equalsIgnoringCase(e))),
      reason:
          'Expected iterable to contain all of $expected ignoring case, but some were missing.',
    );
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in the same order and case-insensitively but may contain
  /// additional values interleaved throughout.
  void shouldContainAllInOrderIgnoringCase(Iterable<String> expected) {
    expect(
      this,
      containsAllInOrder(expected.map((e) => equalsIgnoringCase(e))),
      reason:
          'Expected iterable to contain all of $expected in order ignoring case, but it did not.',
    );
  }
}
