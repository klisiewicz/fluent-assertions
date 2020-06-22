import 'package:test/test.dart';

extension BasicAssertions<T> on T {
  /// Asserts that the value is structurally equal to [expected].
  void shouldBeEqualTo(T expected) => expect(this, equals(expected));

  /// Asserts that the value is structurally different from [expected].
  void shouldNotBeEqualTo(T expected) => expect(this, isNot(equals(expected)));

  // Asserts that the value is null.
  void shouldBeNull() => expect(this, isNull);

  // Asserts that the value is non-null.
  void shouldNotBeNull() => expect(this, isNotNull);
}
