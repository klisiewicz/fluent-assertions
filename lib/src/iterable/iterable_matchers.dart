import 'package:test/test.dart';

Matcher containsAny(Iterable<Object> matchers) {
  return contains(anyOf(matchers));
}
