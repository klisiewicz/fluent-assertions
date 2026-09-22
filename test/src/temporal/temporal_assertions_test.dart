import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
  group('DateTimeAssertions', () {
    final d1 = DateTime(2023, 5, 10, 12);
    final d2 = DateTime(2023, 5, 10, 15);
    final d3 = DateTime(2023, 5, 11, 12);

    group('after / before', () {
      test('shouldBeAfter passes when strictly after', () {
        expect(() => d2.shouldBeAfter(d1), returnsNormally);
      });

      test('shouldBeAfter fails when before or equal', () {
        expect(() => d1.shouldBeAfter(d2), failsTest);
        expect(() => d1.shouldBeAfter(d1), failsTest);
      });

      test('shouldNotBeAfter passes when before or equal', () {
        expect(() => d1.shouldNotBeAfter(d2), returnsNormally);
        expect(() => d1.shouldNotBeAfter(d1), returnsNormally);
      });

      test('shouldBeBefore passes when strictly before', () {
        expect(() => d1.shouldBeBefore(d2), returnsNormally);
      });

      test('shouldBeBefore fails when after or equal', () {
        expect(() => d2.shouldBeBefore(d1), failsTest);
        expect(() => d2.shouldBeBefore(d2), failsTest);
      });

      test('shouldNotBeBefore passes when after or equal', () {
        expect(() => d2.shouldNotBeBefore(d1), returnsNormally);
        expect(() => d2.shouldNotBeBefore(d2), returnsNormally);
      });
    });

    group('same moment', () {
      test(
          'shouldBeAtSameMomentAs passes for same moment even with different timezones',
          () {
        final utc = DateTime.utc(2023, 5, 10, 12);
        final local = utc.toLocal();
        expect(() => utc.shouldBeAtSameMomentAs(local), returnsNormally);
      });

      test('shouldBeAtSameMomentAs fails for different moments', () {
        expect(() => d1.shouldBeAtSameMomentAs(d2), failsTest);
      });

      test('shouldNotBeAtSameMomentAs passes for different moments', () {
        expect(() => d1.shouldNotBeAtSameMomentAs(d2), returnsNormally);
      });

      test('shouldNotBeAtSameMomentAs fails for same moment', () {
        expect(() => d1.shouldNotBeAtSameMomentAs(d1), failsTest);
      });
    });

    group('between', () {
      test('shouldBeBetween passes when within range or on bounds', () {
        expect(() => d2.shouldBeBetween(d1, d3), returnsNormally);
        expect(() => d1.shouldBeBetween(d1, d3), returnsNormally);
        expect(() => d3.shouldBeBetween(d1, d3), returnsNormally);
      });

      test('shouldBeBetween fails when out of range', () {
        final early = DateTime(2020);
        expect(() => early.shouldBeBetween(d1, d3), failsTest);
      });

      test('shouldNotBeBetween passes when outside range', () {
        final late = DateTime(2025);
        expect(() => late.shouldNotBeBetween(d1, d3), returnsNormally);
      });

      test('shouldNotBeBetween fails when within range', () {
        expect(() => d2.shouldNotBeBetween(d1, d3), failsTest);
      });
    });

    group('calendar parts and near', () {
      test('shouldBeInYear / Month / Day', () {
        expect(() => d1.shouldBeInYear(2023), returnsNormally);
        expect(() => d1.shouldBeInYear(2022), failsTest);

        expect(() => d1.shouldBeInMonth(5), returnsNormally);
        expect(() => d1.shouldBeInMonth(6), failsTest);

        expect(() => d1.shouldBeOnDay(10), returnsNormally);
        expect(() => d1.shouldBeOnDay(11), failsTest);
      });

      test('shouldBeOnDate ignores time components', () {
        final differentTime = DateTime(2023, 5, 10, 23, 59, 59);
        expect(() => d1.shouldBeOnDate(differentTime), returnsNormally);

        final differentDate = DateTime(2023, 5, 11, 12);
        expect(() => d1.shouldBeOnDate(differentDate), failsTest);
      });

      test('shouldBeNear and shouldNotBeNear with duration delta', () {
        final dPlus10 = d1.add(const Duration(minutes: 10));
        expect(
          () => d1.shouldBeNear(dPlus10, delta: const Duration(minutes: 15)),
          returnsNormally,
        );
        expect(
          () => d1.shouldBeNear(dPlus10, delta: const Duration(minutes: 5)),
          failsTest,
        );

        expect(
          () => d1.shouldNotBeNear(dPlus10, delta: const Duration(minutes: 5)),
          returnsNormally,
        );
        expect(
          () => d1.shouldNotBeNear(dPlus10, delta: const Duration(minutes: 15)),
          failsTest,
        );
      });

      test('supports fluid chaining', () {
        expect(
          () => d1
              .shouldBeInYear(2023)
              .shouldBeInMonth(5)
              .shouldBeOnDay(10)
              .shouldBeBefore(d2),
          returnsNormally,
        );
      });
    });
  });

  group('DurationAssertions', () {
    const d10m = Duration(minutes: 10);
    const d5m = Duration(minutes: 5);
    const neg = Duration(minutes: -1);
    const zero = Duration.zero;

    test('longer / shorter than', () {
      expect(() => d10m.shouldBeLongerThan(d5m), returnsNormally);
      expect(() => d5m.shouldBeLongerThan(d10m), failsTest);

      expect(() => d5m.shouldBeShorterThan(d10m), returnsNormally);
      expect(() => d10m.shouldBeShorterThan(d5m), failsTest);
    });

    test('equality', () {
      expect(() => d10m.shouldBeEqualTo(const Duration(seconds: 600)),
          returnsNormally);
      expect(() => d10m.shouldNotBeEqualTo(d5m), returnsNormally);

      expect(() => d10m.shouldBeEqualTo(d5m), failsTest);
      expect(() => d10m.shouldNotBeEqualTo(const Duration(seconds: 600)),
          failsTest);
    });

    test('positive / negative / zero', () {
      expect(() => d10m.shouldBePositive(), returnsNormally);
      expect(() => d10m.shouldNotBeNegative(), returnsNormally);
      expect(() => d10m.shouldNotBeZero(), returnsNormally);

      expect(() => neg.shouldBeNegative(), returnsNormally);
      expect(() => neg.shouldNotBePositive(), returnsNormally);

      expect(() => zero.shouldBeZero(), returnsNormally);
      expect(() => zero.shouldNotBePositive(), returnsNormally);
      expect(() => zero.shouldNotBeNegative(), returnsNormally);
    });

    test('supports fluid chaining', () {
      expect(
        () => d10m.shouldBePositive().shouldBeLongerThan(d5m).shouldNotBeZero(),
        returnsNormally,
      );
    });
  });
}
