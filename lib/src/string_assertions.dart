import 'package:test/expect.dart';

extension StringAssertions on String {
  void shouldBeEqualTo(String expected) {
    expect(this, equals(expected));
  }

  void shouldNotBeEqualTo(String expected) {
    expect(this, isNot(equals(expected)));
  }

  void shouldStartWith(String expected) {
    expect(
      this.startsWith(expected),
      isTrue,
      reason: 'Expected the String $this to start with $expected',
    );
  }

  void shouldNotStartWith(String expected) {
    expect(
      this.startsWith(expected),
      isFalse,
      reason: 'Expected the String $this to not start with $expected',
    );
  }

  void shouldEndWith(String expected) {
    expect(
      this.endsWith(expected),
      isTrue,
      reason: 'Expected the String $this to end with $expected',
    );
  }

  void shouldNotEndWith(String expected) {
    expect(
      this.endsWith(expected),
      isFalse,
      reason: 'Expected the String $this to not to end with $expected',
    );
  }

  void shouldContain(String expected) {
    expect(
      this.contains(expected),
      isTrue,
      reason: 'Expected the String $this to contain $expected',
    );
  }

  void shouldNotContain(String expected) {
    expect(
      this.contains(expected),
      isFalse,
      reason: 'Expected the String $this to not to contain $expected',
    );
  }

  void shouldContainSome() {}

  void shouldContainNone() {}

  void shouldMatch() {}

  void shouldNotMatch() {}

  void shouldBeEmpty() {}

  void shouldNotBeEmpty() {}

  void shouldBeBlank() {}

  void shouldNotBeBlank() {}
}

extension StringNullableAssertions on String? {
  void shouldBeNullOrEmpty() {}

  void shouldNotBeNullOrEmpty() {}

  void shouldBeNullOrBlank() {}

  void shouldNotBeNullOrBlank() {}
}
