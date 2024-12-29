import 'package:test/test.dart';

extension BaseAssertions<T> on T? {
  /// Asserts that the value is structurally equal to [expected].
  void shouldBeEqualTo(T expected) => expect(this, equals(expected));

  /// Asserts that the value is structurally different from [expected].
  void shouldNotBeEqualTo(T expected) => expect(this, isNot(equals(expected)));

  /// Asserts that the value is the same instance as [expected], using [identical].
  void shouldBe(T expected) => expect(this, same(expected));

  /// Asserts that the value is not the same instance as [expected], using [identical].
  void shouldNotBe(T expected) => expect(this, isNot(same(expected)));

  /// Asserts that the value is null.
  void shouldBeNull() => expect(this, isNull);

  /// Asserts that the value is non-null.
  void shouldNotBeNull() => expect(this, isNotNull);

  /// Asserts that the value is of type [E].
  /// [E] - Expected type.
  void shouldBeInstanceOf<E>() => expect(this, isA<E>());

  /// Asserts that the value is not of type [E].
  /// [E] - Expected type.
  void shouldNotBeInstanceOf<E>() => expect(this, isNot(isA<E>()));
}

extension BoolAssertions on bool {
  /// Asserts that the value is true.
  void shouldBeTrue() => expect(this, isTrue);

  /// Asserts that the value is true.
  void shouldNotBeFalse() => expect(this, isNot(isFalse));

  /// Asserts that the value is false.
  void shouldBeFalse() => expect(this, isFalse);

  /// Asserts that the value is false.
  void shouldNotBeTrue() => expect(this, isNot(isTrue));
}
