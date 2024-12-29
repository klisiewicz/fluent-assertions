import 'package:fluent_assertions/src/iterable/iterable_matchers.dart';
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
    expect(this, containsAny(expected));
  }

  /// Asserts that [Iterable] contains none of [expected].
  void shouldContainNone(Iterable<T> expected) {
    expect(this, isNot(containsAny(expected)));
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
}

extension IterableStringAssertions on Iterable<String> {
  /// Asserts that [Iterable] contains [expected] ignoring case sensitivity.
  void shouldContainIgnoringCase(String? expected) {
    expect(this, containsIgnoringCase(expected));
  }

  /// Asserts that [Iterable] contains [expected] ignoring case sensitivity.
  void shouldNotContainIgnoringCase(String? expected) {
    expect(this, isNot(containsIgnoringCase(expected)));
  }

  /// Asserts that [Iterable] contains any of [expected] ignoring case sensitivity.
  void shouldContainAnyIgnoringCase(Iterable<String> expected) {
    expect(this, containsAny(expected, caseSensitive: false));
  }

  /// Asserts that [Iterable] contains none of [expected] ignoring case sensitivity.
  void shouldContainNoneIgnoringCase(Iterable<String> expected) {
    expect(this, isNot(containsAny(expected, caseSensitive: false)));
  }
}
