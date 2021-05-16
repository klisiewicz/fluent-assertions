extension StringAssertions on String {
  void shouldBeEqualTo(String expected) {}

  void shouldNotBeEqualTo(String expected) {}

  void shouldStartWith() {}

  void shouldNotStartWith() {}

  void shouldEndWith() {}

  void shouldNotEndWith() {}

  void shouldContain() {}

  void shouldNotContain() {}

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
