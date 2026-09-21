import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Extension methods for deep structural equivalency.
extension EquivalencyAssertions<T> on T {
  /// Asserts that [this] is deeply equivalent to [expected].
  T shouldBeEquivalentTo(dynamic expected) {
    checkExpect(
      _areEquivalent(this, expected),
      isTrue,
      reason: 'Expected $this to be equivalent to $expected, but was not.',
    );
    return this;
  }

  /// Asserts that [this] is not deeply equivalent to [expected].
  T shouldNotBeEquivalentTo(dynamic expected) {
    checkExpect(
      _areEquivalent(this, expected),
      isFalse,
      reason: 'Expected $this to not be equivalent to $expected, but was.',
    );
    return this;
  }
}

bool _areEquivalent(dynamic a, dynamic b) {
  if (identical(a, b)) return true;
  if (a == null || b == null) return a == b;

  if (a is DateTime && b is DateTime) {
    return a.isAtSameMomentAs(b);
  }

  if (a is num && b is num) {
    if (a.isNaN && b.isNaN) return true;
    return a == b;
  }

  if (a is Set && b is Set) {
    if (a.length != b.length) return false;
    for (final itemA in a) {
      if (!b.any((itemB) => _areEquivalent(itemA, itemB))) return false;
    }
    return true;
  }

  if (a is Map && b is Map) {
    if (a.length != b.length) return false;
    for (final entry in a.entries) {
      if (!b.containsKey(entry.key)) return false;
      if (!_areEquivalent(entry.value, b[entry.key])) return false;
    }
    return true;
  }

  if (a is Iterable && b is Iterable) {
    final aList = a.toList();
    final bList = b.toList();
    if (aList.length != bList.length) return false;
    for (var i = 0; i < aList.length; i++) {
      if (!_areEquivalent(aList[i], bList[i])) return false;
    }
    return true;
  }

  return a == b;
}
