import 'package:test/test.dart';

Matcher containsIgnoringCase(Object? expected) =>
    _ContainsIgnoringCase(expected);

class _ContainsIgnoringCase extends Matcher {
  final Object? _expected;

  const _ContainsIgnoringCase(this._expected);

  @override
  bool matches(Object? item, Map matchState) {
    final expected = _expected;

    if (item is String) {
      if (expected is String) {
        return item.toLowerCase().contains(expected.toLowerCase());
      }
      if (expected is Pattern) {
        return (expected is RegExp)
            ? item.contains(expected.caseInsensitive())
            : item.contains(expected);
      }
    }

    if (item is Iterable) {
      if (expected is Matcher) {
        return item.any((e) => expected.matches(e, matchState));
      }
      if (expected is String) {
        return item.any((e) {
          if (e is String) {
            return e.toLowerCase() == expected.toLowerCase();
          }
          return false;
        });
      }
      return item.contains(_expected);
    }

    if (item is Map) {
      if (expected is String) {
        return item.keys.any((k) {
          if (k is String) {
            return k.toLowerCase() == expected.toLowerCase();
          }
          return false;
        });
      }
      return item.containsKey(_expected);
    }

    return false;
  }

  @override
  Description describe(Description description) {
    if (_expected is String) {
      description
          .add('contains (case insensitive) ')
          .addDescriptionOf(_expected);
    } else {
      description.add('contains ').addDescriptionOf(_expected);
    }
    return description;
  }

  @override
  Description describeMismatch(
    Object? item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    if (item is String || item is Iterable || item is Map) {
      super.describeMismatch(item, mismatchDescription, matchState, verbose);
      if (item is String) {
        mismatchDescription
            .add('does not contain (case insensitive) ')
            .addDescriptionOf(_expected);
      } else if (item is Iterable) {
        if (_expected is String) {
          mismatchDescription
              .add('does not contain an element equal to (case insensitive) ')
              .addDescriptionOf(_expected);
        } else {
          mismatchDescription
              .add('does not contain ')
              .addDescriptionOf(_expected);
        }
      } else if (item is Map) {
        if (_expected is String) {
          mismatchDescription
              .add('does not contain a key equal to (case insensitive) ')
              .addDescriptionOf(_expected);
        } else {
          mismatchDescription
              .add('does not contain key ')
              .addDescriptionOf(_expected);
        }
      }
      return mismatchDescription;
    } else {
      return mismatchDescription.add('is not a string, map, or iterable');
    }
  }
}

Matcher containsAny(Iterable<Object> matchers) {
  return contains(anyOf(matchers));
}

extension on RegExp {
  RegExp caseInsensitive() {
    return RegExp(
      pattern,
      caseSensitive: false,
      multiLine: isMultiLine,
      dotAll: isDotAll,
      unicode: isUnicode,
    );
  }
}
