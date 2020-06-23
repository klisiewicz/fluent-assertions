import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import 'matchers.dart';
import 'person.dart';

void main() {
  group('equality', () {
    group('strings', () {
      test('should return normally when equal', () {
        expect(
          () => 'Hello'.shouldBeEqualTo('Hello'),
          returnsNormally,
        );
      });

      test('should fail when not equal', () {
        expect(
          () => 'Hello'.shouldBeEqualTo('Word'),
          failsTest,
        );
      });

      test('should return normally when not equal', () {
        expect(
          () => 'Hello'.shouldNotBeEqualTo('Word'),
          returnsNormally,
        );
      });

      test('should fail when equal', () {
        expect(
          () => 'Hello'.shouldNotBeEqualTo('Hello'),
          failsTest,
        );
      });
    });

    group('numbers', () {
      test('should return normally when equal', () {
        expect(
          () => 1.shouldBeEqualTo(1),
          returnsNormally,
        );
      });

      test('should fail when numbers not equal', () {
        expect(
          () => 1.shouldNotBeEqualTo(1),
          failsTest,
        );
      });

      test('should return normally when not equal', () {
        expect(
          () => 1.shouldNotBeEqualTo(2),
          returnsNormally,
        );
      });

      test('should fail when equal', () {
        expect(
          () => 1.shouldNotBeEqualTo(1),
          failsTest,
        );
      });
    });

    group('objects', () {
      final me = Person(name: 'Karol');
      final alsoMe = Person(name: 'Karol');
      final someoneElse = Person(name: 'Janusz');

      test('should return normally when equal', () {
        expect(
          () => me.shouldBeEqualTo(alsoMe),
          returnsNormally,
        );
      });

      test('should fail when not equal', () {
        expect(
          () => me.shouldBeEqualTo(someoneElse),
          failsTest,
        );
      });

      test('should fail when equal', () {
        expect(
          () => me.shouldNotBeEqualTo(alsoMe),
          failsTest,
        );
      });

      test('should return normally when not equal', () {
        expect(
          () => me.shouldNotBeEqualTo(someoneElse),
          returnsNormally,
        );
      });
    });
  });

  group('reference equality', () {
    group('objects', () {
      final me = Person(name: 'Karol');
      final alsoMe = Person(name: 'Karol');

      test('should return normally when same instance', () {
        expect(
          () => me.shouldBe(me),
          returnsNormally,
        );
      });

      test('should fail when same different instances', () {
        expect(
          () => me.shouldBe(alsoMe),
          failsTest,
        );
      });

      test('should fail when same instance', () {
        expect(
          () => me.shouldNotBe(me),
          failsTest,
        );
      });

      test('should return normally when different instances', () {
        expect(
          () => me.shouldNotBe(alsoMe),
          returnsNormally,
        );
      });
    });
  });

  group('nullability', () {
    const Person nullPerson = null;
    final me = Person(name: 'Karol');

    test('should return normally when null', () {
      expect(
        () => nullPerson.shouldBeNull(),
        returnsNormally,
      );
    });

    test('should fail when not null', () {
      expect(
        () => me.shouldBeNull(),
        failsTest,
      );
    });

    test('should return normally when not null', () {
      expect(
        () => me.shouldNotBeNull(),
        returnsNormally,
      );
    });

    test('should fail when null', () {
      expect(
        () => nullPerson.shouldNotBeNull(),
        failsTest,
      );
    });
  });

  group('booleans', () {
    const isTrue = true;
    const isFalse = false;

    test('should return normally when true', () {
      expect(
        () => isTrue.shouldBeTrue(),
        returnsNormally,
      );
      expect(
        () => isTrue.shouldNotBeFalse(),
        returnsNormally,
      );
    });

    test('should fail when false', () {
      expect(
        () => isTrue.shouldBeFalse(),
        failsTest,
      );
      expect(
        () => isTrue.shouldNotBeTrue(),
        failsTest,
      );
    });

    test('should return normally when false', () {
      expect(
        () => isFalse.shouldBeFalse(),
        returnsNormally,
      );
      expect(
        () => isFalse.shouldNotBeTrue(),
        returnsNormally,
      );
    });

    test('should fail when true', () {
      expect(
        () => isFalse.shouldBeTrue(),
        failsTest,
      );
      expect(
        () => isFalse.shouldNotBeFalse(),
        failsTest,
      );
    });
  });

  group('sub types', () {
    const num someNumber = 10.0;

    test('should return normally when proper subtype', () {
      expect(
        () => someNumber.shouldBeInstanceOf<double>(),
        returnsNormally,
      );
    });

    test('should fail when not proper subtype', () {
      expect(
        () => someNumber.shouldBeInstanceOf<int>(),
        failsTest,
      );
    });

    test('should fail when proper subtype', () {
      expect(
        () => someNumber.shouldNotBeInstanceOf<double>(),
        failsTest,
      );
    });

    test('should return normally when not proper subtype', () {
      expect(
        () => someNumber.shouldNotBeInstanceOf<int>(),
        returnsNormally,
      );
    });
  });
}
