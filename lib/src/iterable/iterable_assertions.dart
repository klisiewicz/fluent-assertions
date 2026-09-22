import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:fluent_assertions/src/iterable/iterable_matchers.dart';
import 'package:test/test.dart';

bool _haveSameElements<E>(Iterable<E> a, Iterable<E> b) {
  if (a.length != b.length) return false;
  final bList = b.toList();
  for (final item in a) {
    final index = bList.indexOf(item);
    if (index == -1) return false;
    bList.removeAt(index);
  }
  return bList.isEmpty;
}

/// Extension methods on [Iterable] for type-checking elements.
extension IterableObjectAssertions on Iterable<Object> {
  /// Asserts that every value in [Iterable] is of type [E].
  Iterable<Object> shouldAllBeInstanceOf<E>() {
    checkExpect(
      this,
      everyElement((e) => e is E),
      reason: 'Expected all elements to be instances of $E, but some were not.',
    );
    return this;
  }

  /// Asserts that at least one value in [Iterable] is of type [E].
  Iterable<Object> shouldAnyBeInstanceOf<E>() {
    checkExpect(
      this,
      anyElement((e) => e is E),
      reason:
          'Expected at least one element to be an instance of $E, but none were.',
    );
    return this;
  }

  /// Asserts that no value in [Iterable] is of type [E].
  Iterable<Object> shouldNoneBeInstanceOf<E>() {
    checkExpect(
      this,
      everyElement((e) => e is! E),
      reason: 'Expected no elements to be instances of $E, but some were.',
    );
    return this;
  }
}

/// General assertion methods for [Iterable].
extension IterableAssertions<T> on Iterable<T> {
  /// Asserts that [Iterable] has [expectedSize] elements.
  Iterable<T> shouldHaveSize(int expectedSize) {
    checkExpect(
      this,
      hasLength(expectedSize),
      reason:
          'Expected iterable to have $expectedSize elements, but found $length.',
    );
    return this;
  }

  /// Alias for [shouldHaveSize].
  Iterable<T> shouldHaveCount(int expectedCount) =>
      shouldHaveSize(expectedCount);

  /// Asserts that [Iterable] is empty.
  Iterable<T> shouldBeEmpty() {
    checkExpect(
      this,
      isEmpty,
      reason: 'Expected iterable to be empty, but it was not.',
    );
    return this;
  }

  /// Asserts that [Iterable] is not empty.
  Iterable<T> shouldNotBeEmpty() {
    checkExpect(
      this,
      isNot(isEmpty),
      reason: 'Expected iterable to not be empty, but it was.',
    );
    return this;
  }

  /// Asserts that [Iterable] has exactly 1 element.
  Iterable<T> shouldHaveSingleItem() {
    checkExpect(
      this,
      hasLength(1),
      reason: 'Expected iterable to have exactly one item, but has $length.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains [expected].
  Iterable<T> shouldContain(T? expected) {
    checkExpect(
      this,
      contains(expected),
      reason: 'Expected iterable to contain $expected, but it did not.',
    );
    return this;
  }

  /// Asserts that [Iterable] does not contain [expected].
  Iterable<T> shouldNotContain(T? expected) {
    checkExpect(
      this,
      isNot(contains(expected)),
      reason: 'Expected iterable to not contain $expected, but it did.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains any element from [expected].
  Iterable<T> shouldContainAny(Iterable<T> expected) {
    checkExpect(
      this,
      containsAny(expected.map(equals).toList()),
      reason:
          'Expected at least one element from $expected to be present in $this.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains none of the elements in [expected].
  Iterable<T> shouldContainNone(Iterable<T> expected) {
    checkExpect(
      this,
      isNot(containsAny(expected.map(equals).toList())),
      reason:
          'Expected iterable to contain none of $expected, but some were found.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains every element in [expected], in any order.
  Iterable<T> shouldContainAll(Iterable<T> expected) {
    checkExpect(
      this,
      containsAll(expected),
      reason:
          'Expected iterable to contain all of $expected, but some were missing.',
    );
    return this;
  }

  /// Asserts that [Iterable] does not contain all elements in [expected].
  Iterable<T> shouldNotContainAll(Iterable<T> expected) {
    checkExpect(
      this,
      isNot(containsAll(expected)),
      reason: 'Expected iterable to not contain all of $expected, but it did.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains the same elements with the same frequencies
  /// as [expected], regardless of order.
  Iterable<T> shouldContainSame(Iterable<T> expected) {
    checkExpect(
      _haveSameElements(this, expected),
      isTrue,
      reason:
          'Expected iterable to contain the same elements as $expected (regardless of order), but was $this.',
    );
    return this;
  }

  /// Alias for [shouldContainSame].
  Iterable<T> shouldEqualUnordered(Iterable<T> expected) =>
      shouldContainSame(expected);

  /// Asserts that [Iterable] does not contain the same elements as [expected].
  Iterable<T> shouldNotContainSame(Iterable<T> expected) {
    checkExpect(
      _haveSameElements(this, expected),
      isFalse,
      reason:
          'Expected iterable to not contain the same elements as $expected, but it did.',
    );
    return this;
  }

  /// Alias for [shouldNotContainSame].
  Iterable<T> shouldNotEqualUnordered(Iterable<T> expected) =>
      shouldNotContainSame(expected);

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in the same order, but may contain additional values
  /// interleaved throughout.
  Iterable<T> shouldContainAllInOrder(Iterable<T> expected) {
    checkExpect(
      this,
      containsAllInOrder(expected),
      reason:
          'Expected iterable to contain all of $expected in order, but it did not.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains at least one element matching [predicate].
  Iterable<T> shouldContainAnyThat(bool Function(T argument) predicate) {
    checkExpect(
      this,
      anyElement(predicate),
      reason:
          'Expected iterable to contain at least one element matching the predicate, but none did.',
    );
    return this;
  }

  /// Alias for [shouldContainAnyThat].
  Iterable<T> shouldContainSome(bool Function(T argument) predicate) =>
      shouldContainAnyThat(predicate);

  /// Alias for [shouldContainAnyThat].
  Iterable<T> shouldMatchAtLeastOneOf(bool Function(T argument) predicate) =>
      shouldContainAnyThat(predicate);

  /// Asserts that all [Iterable] elements match [predicate].
  Iterable<T> shouldContainAllThat(bool Function(T argument) predicate) {
    checkExpect(
      this,
      everyElement(predicate),
      reason:
          'Expected every element in iterable to match the predicate, but some did not.',
    );
    return this;
  }

  /// Alias for [shouldContainAllThat].
  Iterable<T> shouldMatchAllWith(bool Function(T argument) predicate) =>
      shouldContainAllThat(predicate);

  /// Asserts that no [Iterable] elements match [predicate].
  Iterable<T> shouldContainNoneThat(bool Function(T argument) predicate) {
    checkExpect(
      this,
      everyElement(isNot(predicate)),
      reason:
          'Expected no elements in iterable to match the predicate, but some did.',
    );
    return this;
  }

  /// Asserts that the iterable is sorted in ascending order according to [comparator],
  /// or natural [Comparable] order if no comparator is provided.
  Iterable<T> shouldBeSorted([Comparator<T>? comparator]) {
    final list = toList();
    var isSorted = true;
    for (var i = 0; i < list.length - 1; i++) {
      final a = list[i];
      final b = list[i + 1];
      final comp = comparator != null
          ? comparator(a, b)
          : (a as Comparable).compareTo(b);
      if (comp > 0) {
        isSorted = false;
        break;
      }
    }
    checkExpect(
      isSorted,
      isTrue,
      reason: 'Expected iterable to be sorted, but it was not: $this',
    );
    return this;
  }

  /// Asserts that the iterable is sorted according to [comparator].
  Iterable<T> shouldBeSortedAccordingTo(Comparator<T> comparator) =>
      shouldBeSorted(comparator);

  /// Asserts that the iterable is not sorted in ascending order.
  Iterable<T> shouldNotBeSorted([Comparator<T>? comparator]) {
    final list = toList();
    var isSorted = true;
    for (var i = 0; i < list.length - 1; i++) {
      final a = list[i];
      final b = list[i + 1];
      final comp = comparator != null
          ? comparator(a, b)
          : (a as Comparable).compareTo(b);
      if (comp > 0) {
        isSorted = false;
        break;
      }
    }
    checkExpect(
      isSorted,
      isFalse,
      reason: 'Expected iterable to not be sorted, but it was: $this',
    );
    return this;
  }
}

/// Extension methods for [Iterable<String>] case-insensitive assertions.
extension IterableStringAssertions on Iterable<String> {
  /// Asserts that [Iterable] contains [expected] case-insensitively.
  Iterable<String> shouldContainIgnoringCase(String expected) {
    checkExpect(
      this,
      containsAll([equalsIgnoringCase(expected)]),
      reason:
          'Expected iterable to contain "$expected" ignoring case, but it did not.',
    );
    return this;
  }

  /// Asserts that [Iterable] does not contain [expected] case-insensitively.
  Iterable<String> shouldNotContainIgnoringCase(String expected) {
    checkExpect(
      this,
      isNot(containsAll([equalsIgnoringCase(expected)])),
      reason:
          'Expected iterable to not contain "$expected" ignoring case, but it did.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains any of [expected] case-insensitively.
  Iterable<String> shouldContainAnyIgnoringCase(Iterable<String> expected) {
    checkExpect(
      this,
      containsAny(expected.map((e) => equalsIgnoringCase(e)).toList()),
      reason:
          'Expected iterable to contain any of $expected ignoring case, but none were found.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains none of [expected] case-insensitively.
  Iterable<String> shouldContainNoneIgnoringCase(Iterable<String> expected) {
    checkExpect(
      this,
      isNot(containsAny(expected.map((e) => equalsIgnoringCase(e)).toList())),
      reason:
          'Expected iterable to contain none of $expected ignoring case, but some were found.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in any order, case-insensitively.
  Iterable<String> shouldContainAllIgnoringCase(Iterable<String> expected) {
    checkExpect(
      this,
      containsAll(expected.map((e) => equalsIgnoringCase(e))),
      reason:
          'Expected iterable to contain all of $expected ignoring case, but some were missing.',
    );
    return this;
  }

  /// Asserts that [Iterable] contains an element matching every value in
  /// [expected] in the same order and case-insensitively.
  Iterable<String> shouldContainAllInOrderIgnoringCase(
      Iterable<String> expected) {
    checkExpect(
      this,
      containsAllInOrder(expected.map((e) => equalsIgnoringCase(e))),
      reason:
          'Expected iterable to contain all of $expected in order ignoring case, but it did not.',
    );
    return this;
  }
}
