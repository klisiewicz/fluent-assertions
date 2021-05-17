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

  group('should start with', () {
    test('should return normally when start with', () {
      expect(() => 'name'.shouldStartWith('n'), returnsNormally);
    });

    test('should fail when does not start with', () {
      expect(() => 'name'.shouldBeEqualTo('a'), failsTest);
    });
  });

  group('should not start with', () {
    test('should fail when start with', () {
      expect(() => 'name'.shouldNotStartWith('n'), failsTest);
    });

    test('should return normally when does not start with', () {
      expect(() => 'name'.shouldNotStartWith('a'), returnsNormally);
    });
  });

  group('should end with', () {
    test('should return normally when ends with', () {
      expect(() => 'name'.shouldEndWith('me'), returnsNormally);
    });

    test('should fail when does not end with', () {
      expect(() => 'name'.shouldEndWith('ee'), failsTest);
    });
  });

  group('should not end with', () {
    test('should fail when ends with', () {
      expect(() => 'name'.shouldNotEndWith('me'), failsTest);
    });

    test('should return normally when does not end with', () {
      expect(() => 'name'.shouldNotEndWith('ee'), returnsNormally);
    });
  });

  group('should contain', () {
    test('should return normally when contains', () {
      expect(() => 'name'.shouldContain('am'), returnsNormally);
    });

    test('should fail when does not end with', () {
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

  group('should contain some', () {});

  group('should contain none', () {});

  group('should match', () {
    test('should return normally when matches reg exp', () {
      expect(() => 'name'.shouldMatch(RegExp(r"(\w+)")), returnsNormally);
    });

    test('should fail when does not match reg exp', () {
      expect(() => 'name'.shouldMatch(RegExp(r"(\d+)")), failsTest);
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

  group('should be null or empty', () {});

  group('should not be null or empty', () {});

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

  group('should be null or blank', () {});

  group('should not be null or blank', () {});
}
