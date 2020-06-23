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

extension BoolAssertions on bool {
  // Asserts that the value is true.
  void shouldBeTrue() => expect(this, isTrue);

  // Asserts that the value is true.
  void shouldNotBeFalse() => expect(this, isNot(isFalse));

  // Asserts that the value is false.
  void shouldBeFalse() => expect(this, isFalse);

  // Asserts that the value is true.
  void shouldNotBeTrue() => expect(this, isNot(isTrue));
}
