import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Extension methods for assertions on [Map].
extension MapAssertions<K, V> on Map<K, V> {
  /// Asserts that the map contains the specified [key].
  Map<K, V> shouldHaveKey(K key) {
    checkExpect(
      containsKey(key),
      isTrue,
      reason: 'Expected map to contain key $key, but keys were $keys.',
    );
    return this;
  }

  /// Asserts that the map does not contain the specified [key].
  Map<K, V> shouldNotHaveKey(K key) {
    checkExpect(
      containsKey(key),
      isFalse,
      reason: 'Expected map to not contain key $key, but it did.',
    );
    return this;
  }

  /// Asserts that the map contains the specified [value].
  Map<K, V> shouldHaveValue(V value) {
    checkExpect(
      this.containsValue(value),
      isTrue,
      reason: 'Expected map to contain value $value, but values were $values.',
    );
    return this;
  }

  /// Asserts that the map does not contain the specified [value].
  Map<K, V> shouldNotHaveValue(V value) {
    checkExpect(
      this.containsValue(value),
      isFalse,
      reason: 'Expected map to not contain value $value, but it did.',
    );
    return this;
  }

  /// Asserts that the map contains the key-value pair ([key], [value]).
  Map<K, V> shouldContain(K key, V value) {
    checkExpect(
      containsKey(key) && this[key] == value,
      isTrue,
      reason:
          'Expected map to contain entry ($key: $value), but was ${containsKey(key) ? "($key: ${this[key]})" : "missing key"}',
    );
    return this;
  }

  /// Asserts that the map does not contain the key-value pair ([key], [value]).
  Map<K, V> shouldNotContain(K key, V value) {
    checkExpect(
      containsKey(key) && this[key] == value,
      isFalse,
      reason: 'Expected map to not contain entry ($key: $value), but it did.',
    );
    return this;
  }

  /// Asserts that the map contains [entry].
  Map<K, V> shouldContainEntry(MapEntry<K, V> entry) =>
      shouldContain(entry.key, entry.value);

  /// Asserts that the map does not contain [entry].
  Map<K, V> shouldNotContainEntry(MapEntry<K, V> entry) =>
      shouldNotContain(entry.key, entry.value);

  /// Asserts that the map contains the exact same key-value pairs as [expected].
  Map<K, V> shouldContainSame(Map<K, V> expected) {
    var same = length == expected.length;
    if (same) {
      for (final entry in expected.entries) {
        if (!containsKey(entry.key) || this[entry.key] != entry.value) {
          same = false;
          break;
        }
      }
    }
    checkExpect(
      same,
      isTrue,
      reason:
          'Expected map to contain the same entries as $expected, but was $this.',
    );
    return this;
  }

  /// Asserts that the map does not contain the exact same key-value pairs as [expected].
  Map<K, V> shouldNotContainSame(Map<K, V> expected) {
    var same = length == expected.length;
    if (same) {
      for (final entry in expected.entries) {
        if (!containsKey(entry.key) || this[entry.key] != entry.value) {
          same = false;
          break;
        }
      }
    }
    checkExpect(
      same,
      isFalse,
      reason:
          'Expected map to not contain the same entries as $expected, but it did.',
    );
    return this;
  }

  /// Asserts that the map has [expectedSize] entries.
  Map<K, V> shouldHaveSize(int expectedSize) {
    checkExpect(
      length,
      equals(expectedSize),
      reason: 'Expected map to have $expectedSize entries, but had $length.',
    );
    return this;
  }

  /// Alias for [shouldHaveSize].
  Map<K, V> shouldHaveCount(int expectedCount) => shouldHaveSize(expectedCount);

  /// Asserts that the map is empty.
  Map<K, V> shouldBeEmpty() {
    checkExpect(
      this.isEmpty,
      isTrue,
      reason: 'Expected map to be empty, but was not.',
    );
    return this;
  }

  /// Asserts that the map is not empty.
  Map<K, V> shouldNotBeEmpty() {
    checkExpect(
      this.isNotEmpty,
      isTrue,
      reason: 'Expected map to not be empty, but was empty.',
    );
    return this;
  }
}
