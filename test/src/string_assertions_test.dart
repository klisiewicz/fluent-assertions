import 'package:fluent_assertions/src/string_assertions.dart';
import 'package:test/test.dart';

import 'matchers.dart';

void main() {
  group('should be equal to', () {
    test('should return normally when equal', () {
      expect(() => 'name'.shouldBeEqualTo('name'), returnsNormally);
    });

    test('should fail when not equal', () {
      expect(() => 'name'.shouldBeEqualTo('abc'), failsTest);
    });
  });

  group('should not be equal to', () {
    test('should fail when equal', () {
      expect(() => 'name'.shouldNotBeEqualTo('name'), failsTest);
    });

    test('should fail when not equal', () {
      expect(() => 'name'.shouldNotBeEqualTo('abc'), returnsNormally);
    });
  });

  group('should be equal to ignoring case', () {
    test('should return normally when equal with same case', () {
      expect(() => 'name'.shouldBeEqualToIgnoringCase('name'), returnsNormally);
    });

    test('should return normally when equal with different case', () {
      expect(() => 'name'.shouldBeEqualToIgnoringCase('NAME'), returnsNormally);
    });

    test('should fail when not equal', () {
      expect(() => 'name'.shouldBeEqualToIgnoringCase('abc'), failsTest);
    });
  });

  group('should not be equal to ignoring case', () {
    test('should fail when equal with same case', () {
      expect(
        () => 'name'.shouldNotBeEqualToIgnoringCase('name'),
        failsTest,
      );
    });

    test('should return normally when equal with different case', () {
      expect(
        () => 'name'.shouldNotBeEqualToIgnoringCase('NAME'),
        failsTest,
      );
    });

    test('should return normally when not equal', () {
      expect(
        () => 'name'.shouldNotBeEqualToIgnoringCase('abc'),
        returnsNormally,
      );
    });
  });

  group('should start with', () {
    test('should return normally when start with', () {
      expect(() => 'name'.shouldStartWith('n'), returnsNormally);
    });

    test('should fail when does not start with', () {
      expect(() => 'name'.shouldBeEqualTo('a'), failsTest);
    });

    test('should fail when starts with different case', () {
      expect(() => 'name'.shouldBeEqualTo('N'), failsTest);
    });
  });

  group('should not start with', () {
    test('should fail when start with', () {
      expect(() => 'name'.shouldNotStartWith('n'), failsTest);
    });

    test('should return normally when starts with different case', () {
      expect(() => 'name'.shouldNotStartWith('N'), returnsNormally);
    });

    test('should return normally when does not start with', () {
      expect(() => 'name'.shouldNotStartWith('a'), returnsNormally);
    });
  });

  group('should start with ignoring case', () {
    test('should return normally when start with same case', () {
      expect(() => 'name'.shouldStartWithIgnoringCase('n'), returnsNormally);
    });

    test('should return normally when starts with different case', () {
      expect(() => 'name'.shouldStartWithIgnoringCase('N'), returnsNormally);
    });

    test('should fail when does not start with', () {
      expect(() => 'name'.shouldStartWithIgnoringCase('a'), failsTest);
    });
  });

  group('should not start with ignoring case', () {
    test('should fail when start with same case', () {
      expect(() => 'name'.shouldNotStartWithIgnoringCase('n'), failsTest);
    });

    test('should fail when starts with different case', () {
      expect(() => 'name'.shouldNotStartWithIgnoringCase('N'), failsTest);
    });

    test('should return normally when does not start with', () {
      expect(() => 'name'.shouldNotStartWithIgnoringCase('a'), returnsNormally);
    });
  });

  group('should end with', () {
    test('should return normally when ends with same case', () {
      expect(() => 'name'.shouldEndWith('me'), returnsNormally);
    });

    test('should fail when ends with different case', () {
      expect(() => 'name'.shouldEndWith('ME'), failsTest);
    });

    test('should fail when does not end with', () {
      expect(() => 'name'.shouldEndWith('ee'), failsTest);
    });
  });

  group('should not end with', () {
    test('should fail when ends with same case', () {
      expect(() => 'name'.shouldNotEndWith('me'), failsTest);
    });

    test('should return normally when ends with different case', () {
      expect(() => 'name'.shouldNotEndWith('ME'), returnsNormally);
    });

    test('should return normally when does not end with', () {
      expect(() => 'name'.shouldNotEndWith('ee'), returnsNormally);
    });
  });

  group('should not end with', () {
    test('should fail when ends with same case', () {
      expect(() => 'name'.shouldNotEndWithIgnoringCase('me'), failsTest);
    });

    test('should fail when ends with different case', () {
      expect(() => 'name'.shouldNotEndWithIgnoringCase('ME'), failsTest);
    });

    test('should return normally when does not end with', () {
      expect(() => 'name'.shouldNotEndWithIgnoringCase('ee'), returnsNormally);
    });
  });

  group('should end with ignoring case', () {
    test('should return normally when ends with same case', () {
      expect(() => 'name'.shouldEndWithIgnoringCase('me'), returnsNormally);
    });

    test('should return normally when ends with different case', () {
      expect(() => 'name'.shouldEndWithIgnoringCase('ME'), returnsNormally);
    });

    test('should fail when does not end with', () {
      expect(() => 'name'.shouldEndWithIgnoringCase('ee'), failsTest);
    });
  });

  group('should not end with ignoring case', () {
    test('should fail when ends with same case', () {
      expect(() => 'name'.shouldNotEndWithIgnoringCase('me'), failsTest);
    });

    test('should fail when ends with different case', () {
      expect(() => 'name'.shouldNotEndWithIgnoringCase('ME'), failsTest);
    });

    test('should return normally when does not end with', () {
      expect(() => 'name'.shouldNotEndWithIgnoringCase('ee'), returnsNormally);
    });
  });

  group('should contain', () {
    test('should return normally when contains the same case', () {
      expect(() => 'name'.shouldContain('am'), returnsNormally);
    });

    test('should fail when contains the different case', () {
      expect(() => 'name'.shouldContain('AM'), failsTest);
    });

    test('should fail when does not contain', () {
      expect(() => 'name'.shouldContain('aa'), failsTest);
    });
  });

  group('should not contain', () {
    test('should fail when contains', () {
      expect(() => 'name'.shouldNotContain('am'), failsTest);
    });

    test('should return normally when does not contain', () {
      expect(() => 'name'.shouldNotContain('aa'), returnsNormally);
    });
  });

  group('should contain ignoring case', () {
    test('should return normally when contains the same case', () {
      expect(() => 'name'.shouldContainIgnoringCase('am'), returnsNormally);
    });

    test('should return normally when contains the different case', () {
      expect(() => 'name'.shouldContainIgnoringCase('AM'), returnsNormally);
    });

    test('should fail when does not contain', () {
      expect(() => 'name'.shouldContainIgnoringCase('aa'), failsTest);
    });
  });

  group('should not contain ignoring case', () {
    test('should fail when contains the same case', () {
      expect(() => 'name'.shouldNotContainIgnoringCase('am'), failsTest);
    });

    test('should fail when contains the different case', () {
      expect(() => 'name'.shouldNotContainIgnoringCase('AM'), failsTest);
    });

    test('should return normally when does not contain', () {
      expect(() => 'name'.shouldNotContainIgnoringCase('aa'), returnsNormally);
    });
  });

  group('should contain all', () {
    test('should return normally when contains all in order', () {
      expect(
        () => 'name'.shouldContainAll(['n', 'a', 'm', 'e']),
        returnsNormally,
      );
      expect(
        () => 'name'.shouldContainAll(['n', 'a']),
        returnsNormally,
      );
    });

    test('should return normally when contains all in any order', () {
      expect(
        () => 'name'.shouldContainAll(['e', 'm', 'a', 'n']),
        returnsNormally,
      );
      expect(
        () => 'name'.shouldContainAll(['a', 'n']),
        returnsNormally,
      );
    });

    test('should fail when contains all but with different case', () {
      expect(
        () => 'name'.shouldContainAll(['N', 'A']),
        failsTest,
      );
    });

    test('should fail when contains some', () {
      expect(
        () => 'name'.shouldContainAll(['n', 'x']),
        failsTest,
      );
    });

    test('should fail when contains none', () {
      expect(
        () => 'name'.shouldContainAll(['x', 'y']),
        failsTest,
      );
    });
  });

  group('should contain all ignoring case', () {
    test(
        'should return normally when contains all in order with different case',
        () {
      expect(
        () => 'name'.shouldContainAllIgnoringCase(['N', 'a', 'm', 'E']),
        returnsNormally,
      );
    });

    test(
        'should return normally when contains all in any order with different case',
        () {
      expect(
        () => 'name'.shouldContainAllIgnoringCase(['E', 'M', 'a', 'n']),
        returnsNormally,
      );
    });

    test('should fail when contains some', () {
      expect(
        () => 'name'.shouldContainAllIgnoringCase(['N', 'x']),
        failsTest,
      );
    });

    test('should fail when contains none', () {
      expect(
        () => 'name'.shouldContainAllIgnoringCase(['x', 'y']),
        failsTest,
      );
    });
  });

  group('should contain all in order', () {
    test('should return normally when contains all in order', () {
      expect(
        () => 'name'.shouldContainAllInOrder(['n', 'a', 'm', 'e']),
        returnsNormally,
      );
      expect(
        () => 'name'.shouldContainAllInOrder(['n', 'a']),
        returnsNormally,
      );
    });

    test('should fail when contains all, but not in order', () {
      expect(
        () => 'name'.shouldContainAllInOrder(['e', 'm', 'a', 'n']),
        failsTest,
      );
      expect(
        () => 'name'.shouldContainAllInOrder(['a', 'n']),
        failsTest,
      );
    });

    test('should fail when contains some', () {
      expect(
        () => 'name'.shouldContainAllInOrder(['n', 'x']),
        failsTest,
      );
    });

    test('should fail when contains none', () {
      expect(
        () => 'name'.shouldContainAllInOrder(['x', 'y']),
        failsTest,
      );
    });
  });

  group('should contain all in order ignoringCase', () {
    test('should return normally when contains all in order', () {
      expect(
        () => 'name'.shouldContainAllInOrderIgnoringCase(['N', 'a']),
        returnsNormally,
      );
    });

    test('should fail when contains all, but not in order', () {
      expect(
        () => 'name'.shouldContainAllInOrderIgnoringCase(['a', 'N']),
        failsTest,
      );
    });

    test('should fail when contains some', () {
      expect(
        () => 'name'.shouldContainAllInOrderIgnoringCase(['N', 'x']),
        failsTest,
      );
    });

    test('should fail when contains none', () {
      expect(
        () => 'name'.shouldContainAllInOrderIgnoringCase(['x', 'y']),
        failsTest,
      );
    });
  });

  group('should match', () {
    test('should return normally when matches reg exp', () {
      expect(() => 'name'.shouldMatch(RegExp(r"(\w+)")), returnsNormally);
      expect(() => 'name'.shouldMatch(r"(\w+)"), returnsNormally);
    });

    test('should fail when does not match reg exp', () {
      expect(() => 'name'.shouldMatch(RegExp(r"(\d+)")), failsTest);
      expect(() => 'name'.shouldMatch(r"(\d+)"), failsTest);
    });
  });

  group('should not match', () {
    test('should fail when matches reg exp', () {
      expect(() => 'name'.shouldNotMatch(RegExp(r"(\w+)")), failsTest);
    });

    test('should return normally when matches reg exp', () {
      expect(() => 'name'.shouldNotMatch(RegExp(r"(\d+)")), returnsNormally);
    });
  });

  group('should be empty', () {
    test('should return normally when is empty', () {
      expect(() => ''.shouldBeEmpty(), returnsNormally);
    });

    test('should fail when is not empty', () {
      expect(() => ' '.shouldBeEmpty(), failsTest);
    });
  });

  group('should not be empty', () {
    test('should fail test when is empty', () {
      expect(() => ''.shouldNotBeEmpty(), failsTest);
    });

    test('should return normally not empty', () {
      expect(() => ' '.shouldNotBeEmpty(), returnsNormally);
    });
  });

  group('should be null or empty', () {
    test('should return normally when is empty', () {
      expect(() => ''.shouldBeNullOrEmpty(), returnsNormally);
    });

    test('should return normally when is null', () {
      const String? name = null;
      expect(() => name.shouldBeNullOrEmpty(), returnsNormally);
    });

    test('should fail when is not empty', () {
      expect(() => 'name'.shouldBeNullOrEmpty(), failsTest);
    });
  });

  group('should not be null or empty', () {
    test('should fail when is empty', () {
      expect(() => ''.shouldNotBeNullOrEmpty(), failsTest);
    });

    test('should fail when is null', () {
      const String? name = null;
      expect(() => name.shouldNotBeNullOrEmpty(), failsTest);
    });

    test('should return normally when is not empty', () {
      expect(() => 'name'.shouldNotBeNullOrEmpty(), returnsNormally);
    });
  });

  group('should be blank', () {
    test('should return normally when is blank', () {
      expect(() => ' '.shouldBeBlank(), returnsNormally);
    });

    test('should return normally when is empty', () {
      expect(() => ''.shouldBeBlank(), returnsNormally);
    });

    test('should fail when is not blank', () {
      expect(() => 'name'.shouldBeBlank(), failsTest);
    });
  });

  group('should not be blank', () {
    test('should fail test when is blank', () {
      expect(() => ' '.shouldNotBeBlank(), failsTest);
    });

    test('should return normally is not blank', () {
      expect(() => 'name'.shouldNotBeBlank(), returnsNormally);
    });
  });

  group('should be null or blank', () {
    test('should return normally when is empty', () {
      expect(() => ''.shouldBeNullOrBlank(), returnsNormally);
    });

    test('should return normally when is blank', () {
      expect(() => ' '.shouldBeNullOrBlank(), returnsNormally);
    });

    test('should return normally when is null', () {
      const String? name = null;
      expect(() => name.shouldBeNullOrBlank(), returnsNormally);
    });

    test('should fail when is not empty', () {
      expect(() => 'name'.shouldBeNullOrBlank(), failsTest);
    });
  });

  group('should not be null or blank', () {
    test('should fail when is empty', () {
      expect(() => ''.shouldNotBeNullOrBlank(), failsTest);
    });

    test('should fail when is blank', () {
      expect(() => ' '.shouldNotBeNullOrBlank(), failsTest);
    });

    test('should fail when is null', () {
      const String? name = null;
      expect(() => name.shouldNotBeNullOrBlank(), failsTest);
    });

    test('should return normally when is not empty', () {
      expect(() => 'name'.shouldNotBeNullOrBlank(), returnsNormally);
    });
  });
}
