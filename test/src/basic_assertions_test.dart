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
      const me = Person(name: 'Karol', age: 35);
      const alsoMe = Person(name: 'Karol', age: 35);
      const someoneElse = Person(name: 'Janusz', age: 69);

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

  group('nullability', () {
    const Person nullPerson = null;
    const nonNullPerson = Person();

    test('should return normally when null', () {
      expect(
        () => nullPerson.shouldBeNull(),
        returnsNormally,
      );
    });

    test('should fail when not null', () {
      expect(
        () => nonNullPerson.shouldBeNull(),
        failsTest,
      );
    });

    test('should return normally when not null', () {
      expect(
        () => nonNullPerson.shouldNotBeNull(),
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
