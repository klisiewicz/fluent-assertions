import 'package:fluent_assertions/src/iterable/iterable_matchers.dart';
import 'package:test/test.dart' as test show predicate;
import 'package:test/test.dart';

extension IterableAssertions<T> on Iterable<T> {
  /// Asserts that [Iterable] contains [expected].
  void shouldContain(T? expected) {
    expect(this, contains(expected));
  }

  /// Asserts that [Iterable] does not contain [expected].
  void shouldNotContain(T? expected) {
    expect(this, isNot(contains(expected)));
  }

  /// Asserts that [Iterable] contains any of [expected].
  void shouldContainAny(Iterable<T> expected) {
    expect(
      this,
      containsAny(expected.map(equals).toList()),
      reason:
          'Expected at least one element from $expected to be present in $this',
    );
  }

  /// Asserts that [Iterable] contains none of [expected].
  void shouldContainNone(Iterable<T> expected) {
    expect(
      this,
      isNot(containsAny(expected.map(equals).toList())),
      reason: 'Expected no elements from $expected to be present in $this',
    );
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in any order, and may contain additional values.
  void shouldContainAll(Iterable<T> expected) {
    expect(this, containsAll(expected));
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in the same order, but may contain additional values
  /// interleaved throughout.
  void shouldContainAllInOrder(Iterable<T> expected) {
    expect(this, containsAllInOrder(expected));
  }

  /// Asserts that [Iterable] contains an element matching the given [predicate].
  void shouldContainAnyThat(bool Function(T argument) predicate) {
    expect(
      this,
      containsAny([test.predicate(predicate)]),
    );
  }
}

extension IterableStringAssertions on Iterable<String> {
  /// Asserts that [Iterable] contains [expected] case-insensitively.
  void shouldContainIgnoringCase(String expected) {
    expect(
      this,
      containsAll([equalsIgnoringCase(expected)]),
      reason: 'Expected "$this" to contain "$expected" ignoring case',
    );
  }

  /// Asserts that [Iterable] contains [expected] case-insensitively.
  void shouldNotContainIgnoringCase(String expected) {
    expect(
      this,
      isNot(containsAll([equalsIgnoringCase(expected)])),
      reason: 'Expected "$this" not to contain "$expected" ignoring case',
    );
  }

  /// Asserts that [Iterable] contains any of [expected] case-insensitively.
  void shouldContainAnyIgnoringCase(Iterable<String> expected) {
    expect(
      this,
      containsAny(expected.map((e) => equalsIgnoringCase(e)).toList()),
      reason:
          'Expected at least one element from $expected to be present in $this ignoring case',
    );
  }

  /// Asserts that [Iterable] contains none of [expected] case-insensitively.
  void shouldContainNoneIgnoringCase(Iterable<String> expected) {
    expect(
      this,
      isNot(containsAny(expected.map((e) => equalsIgnoringCase(e)).toList())),
      reason:
          'Expected no elements from $expected to be present in $this ignoring case',
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
          'Expected all elements from $expected to be present in $this in any order and ignoring case',
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
          'Expected all elements from $expected to be present in $this in order and ignoring case',
    );
  }
}
