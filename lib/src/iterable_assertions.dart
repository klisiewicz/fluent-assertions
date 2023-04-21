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
}
