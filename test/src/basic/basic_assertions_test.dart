import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';
import '../util/person.dart';

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
      const me = Person(name: 'Karol');
      const alsoMe = Person(name: 'Karol');
      const someoneElse = Person(name: 'Janusz');

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
      // In this case we need explicitly not to use const constructor to create
      // different instances of objects.
      // ignore: prefer_const_constructors
      final me = Person(name: 'Karol');
      // ignore: prefer_const_constructors
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
    const Person? nullPerson = null;
    const me = Person(name: 'Karol');

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

  group('same class', () {
    test('should return normally when runtimeType matches', () {
      expect(
        () => 1.shouldHaveTheSameClassAs(2),
        returnsNormally,
      );
      expect(
        () => 'hello'.shouldHaveTheSameClassAs('world'),
        returnsNormally,
      );
    });

    test('should fail when runtimeType differs', () {
      expect(
        () => 1.shouldHaveTheSameClassAs('1'),
        failsTest,
      );
    });

    test('shouldNotHaveTheSameClassAs passes when types differ', () {
      expect(
        () => 1.shouldNotHaveTheSameClassAs('1'),
        returnsNormally,
      );
    });

    test('shouldNotHaveTheSameClassAs fails when types match', () {
      expect(
        () => 1.shouldNotHaveTheSameClassAs(2),
        failsTest,
      );
    });
  });

  group('shouldBeIn / shouldNotBeIn', () {
    final list = [1, 2, 3];

    test('shouldBeIn passes when element in collection', () {
      expect(() => 2.shouldBeIn(list), returnsNormally);
    });

    test('shouldBeIn fails when element not in collection', () {
      expect(() => 4.shouldBeIn(list), failsTest);
    });

    test('shouldNotBeIn passes when element not in collection', () {
      expect(() => 4.shouldNotBeIn(list), returnsNormally);
    });

    test('shouldNotBeIn fails when element in collection', () {
      expect(() => 2.shouldNotBeIn(list), failsTest);
    });
  });

  group('char digits', () {
    test('shouldBeDigit passes for 0-9 single chars', () {
      expect(() => '5'.shouldBeDigit(), returnsNormally);
      expect(() => '0'.shouldBeDigit(), returnsNormally);
      expect(() => '9'.shouldBeDigit(), returnsNormally);
    });

    test('shouldBeDigit fails for non-digits or multi chars', () {
      expect(() => 'a'.shouldBeDigit(), failsTest);
      expect(() => '12'.shouldBeDigit(), failsTest);
      expect(() => ''.shouldBeDigit(), failsTest);
    });

    test('shouldNotBeDigit passes for non-digits', () {
      expect(() => 'a'.shouldNotBeDigit(), returnsNormally);
      expect(() => '12'.shouldNotBeDigit(), returnsNormally);
    });

    test('shouldNotBeDigit fails for digits', () {
      expect(() => '7'.shouldNotBeDigit(), failsTest);
    });
  });

  group('fluent chaining and null promotion', () {
    test('shouldNotBeNull returns promoted non-null value', () {
      String? getNullable() => 'hello';
      final nonNull = getNullable().shouldNotBeNull();
      expect(nonNull, isA<String>());
      expect(nonNull.length, equals(5));
    });

    test('BaseAssertions chain fluently', () {
      const x = 5;
      expect(
        () => x
            .shouldBeEqualTo(5)
            .shouldNotBeEqualTo(6)
            .shouldBeInstanceOf<int>()
            .shouldBeIn([4, 5, 6]),
        returnsNormally,
      );
    });
  });
}
