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

  group('should end with', () {});

  group('should not end with', () {});

  group('should contain', () {});

  group('should not contain', () {});

  group('should contain some', () {});

  group('should contain none', () {});

  group('should match', () {});

  group('should not match', () {});

  group('should be empty', () {});

  group('should not be empty', () {});

  group('should be null or empty', () {});

  group('should not be null or empty', () {});

  group('should be blank', () {});

  group('should not be blank', () {});

  group('should be null or blank', () {});

  group('should not be null or blank', () {});
}
