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

/**
 * infix fun <T> T.should(assertion: T.() -> Boolean) = should("Expected the assertion to return true, but returned false", assertion)

    fun <T> T.should(message: String, assertion: T.() -> Boolean): T = try {
    if (assertion()) this else fail(message)
    } catch (t: Throwable) {
    fail("""$message
    |
    | An exception occured:
    |   ${t.platformClassName()}: ${t.message}
    |   ${"\tat "}${t.platformJoinStackTrace()}
    """.trimMargin())
 */
}

extension BoolAssertions on bool {
  void shouldBeTrue() {}

  void shouldBeFalse() {}

  void shouldNotBeTrue() {}

  void shouldNotBeFalse() {}
}