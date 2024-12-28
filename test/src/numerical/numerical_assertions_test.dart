import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
  const positiveNumberCloseToZero = 0.00000000000000001;
  const negativeNumberCloseToZero = -0.99999999999999999;

  group('greater or equal', () {
    test('should return normally when greater', () {
      expect(
        () => 2.shouldBeGreaterOrEqualTo(1),
        returnsNormally,
      );

      expect(
        () => 2.000000001.shouldBeGreaterOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should return normally when equal', () {
      expect(
        () => 2.shouldBeGreaterOrEqualTo(2),
        returnsNormally,
      );

      expect(
        () => 2.0.shouldBeGreaterOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should fail when smaller', () {
      expect(
        () => 1.shouldBeGreaterOrEqualTo(2),
        failsTest,
      );

      expect(
        () => 1.99999999.shouldBeGreaterOrEqualTo(2),
        failsTest,
      );
    });
  });

  group('not greater or equal', () {
    test('should return normally when less', () {
      expect(
        () => 1.shouldNotBeGreaterOrEqualTo(2),
        returnsNormally,
      );

      expect(
        () => 1.999999999.shouldNotBeGreaterOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should fail when equal', () {
      expect(
        () => 2.shouldNotBeGreaterOrEqualTo(2),
        failsTest,
      );

      expect(
        () => 2.0.shouldNotBeGreaterOrEqualTo(2),
        failsTest,
      );
    });

    test('should fail when greater', () {
      expect(
        () => 2.shouldNotBeGreaterOrEqualTo(1),
        failsTest,
      );

      expect(
        () => 2.00000001.shouldNotBeGreaterOrEqualTo(2),
        failsTest,
      );
    });
  });

  group('greater', () {
    test('should return normally when greater', () {
      expect(
        () => 2.shouldBeGreaterThan(1),
        returnsNormally,
      );

      expect(
        () => 2.000000001.shouldBeGreaterThan(2),
        returnsNormally,
      );
    });

    test('should fail when equal', () {
      expect(
        () => 2.shouldBeGreaterThan(2),
        failsTest,
      );

      expect(
        () => 2.0.shouldBeGreaterThan(2),
        failsTest,
      );
    });

    test('should fail when smaller', () {
      expect(
        () => 1.shouldBeGreaterThan(2),
        failsTest,
      );

      expect(
        () => 1.99999999.shouldBeGreaterThan(2),
        failsTest,
      );
    });
  });

  group('not greater', () {
    test('should return normally when less', () {
      expect(
        () => 1.shouldNotBeGreaterThan(2),
        returnsNormally,
      );

      expect(
        () => 1.999999999.shouldNotBeGreaterThan(2),
        returnsNormally,
      );
    });

    test('should return normally when equal', () {
      expect(
        () => 2.shouldNotBeGreaterThan(2),
        returnsNormally,
      );

      expect(
        () => 2.0.shouldNotBeGreaterThan(2),
        returnsNormally,
      );
    });

    test('should fail when greater', () {
      expect(
        () => 2.shouldNotBeGreaterThan(1),
        failsTest,
      );

      expect(
        () => 2.00000001.shouldNotBeGreaterThan(2),
        failsTest,
      );
    });
  });

  group('less or equal', () {
    test('should return normally when less', () {
      expect(
        () => 1.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );

      expect(
        () => 1.999999999.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should return normally when equal', () {
      expect(
        () => 2.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );

      expect(
        () => 2.0.shouldBeLessOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should fail when greater', () {
      expect(
        () => 2.shouldBeLessOrEqualTo(1),
        failsTest,
      );

      expect(
        () => 2.00000001.shouldBeLessOrEqualTo(2),
        failsTest,
      );
    });
  });

  group('not less or equal', () {
    test('should return normally when greater', () {
      expect(
        () => 2.shouldNotBeLessOrEqualTo(1),
        returnsNormally,
      );

      expect(
        () => 2.000000001.shouldNotBeLessOrEqualTo(2),
        returnsNormally,
      );
    });

    test('should fail when equal', () {
      expect(
        () => 2.shouldNotBeLessOrEqualTo(2),
        failsTest,
      );

      expect(
        () => 2.0.shouldNotBeLessOrEqualTo(2),
        failsTest,
      );
    });

    test('should fail when smaller', () {
      expect(
        () => 1.shouldNotBeLessOrEqualTo(2),
        failsTest,
      );

      expect(
        () => 1.99999999.shouldNotBeLessOrEqualTo(2),
        failsTest,
      );
    });
  });

  group('less', () {
    test('should return normally when less', () {
      expect(
        () => 1.shouldBeLessThan(2),
        returnsNormally,
      );

      expect(
        () => 1.999999999.shouldBeLessThan(2),
        returnsNormally,
      );
    });

    test('should fail when equal', () {
      expect(
        () => 2.shouldBeLessThan(2),
        failsTest,
      );

      expect(
        () => 2.0.shouldBeLessThan(2),
        failsTest,
      );
    });

    test('should fail when greater', () {
      expect(
        () => 2.shouldBeLessThan(1),
        failsTest,
      );

      expect(
        () => 2.00000001.shouldBeLessThan(2),
        failsTest,
      );
    });
  });

  group('not less', () {
    test('should return normally when greater', () {
      expect(
        () => 2.shouldNotBeLessThan(1),
        returnsNormally,
      );

      expect(
        () => 2.000000001.shouldNotBeLessThan(2),
        returnsNormally,
      );
    });

    test('should return normally when equal', () {
      expect(
        () => 2.shouldNotBeLessThan(2),
        returnsNormally,
      );

      expect(
        () => 2.0.shouldNotBeLessThan(2),
        returnsNormally,
      );
    });

    test('should fail when smaller', () {
      expect(
        () => 1.shouldNotBeLessThan(2),
        failsTest,
      );

      expect(
        () => 1.99999999.shouldNotBeLessThan(2),
        failsTest,
      );
    });
  });

  group('positive', () {
    test('should return normally when positive', () {
      expect(
        () => 1.shouldBePositive(),
        returnsNormally,
      );

      expect(
        () => positiveNumberCloseToZero.shouldBePositive(),
        returnsNormally,
      );
    });

    test('should fail when zero', () {
      expect(
        () => 0.shouldBePositive(),
        failsTest,
      );
    });

    test('should fail when negative', () {
      expect(
        () => (-1).shouldBePositive(),
        failsTest,
      );

      expect(
        () => negativeNumberCloseToZero.shouldBePositive(),
        failsTest,
      );
    });
  });

  group('not positive', () {
    test('should return normally when negative', () {
      expect(
        () => (-1).shouldNotBePositive(),
        returnsNormally,
      );

      expect(
        () => negativeNumberCloseToZero.shouldNotBePositive(),
        returnsNormally,
      );
    });

    test('should return normally when zero', () {
      expect(
        () => 0.shouldNotBePositive(),
        returnsNormally,
      );
    });

    test('should fail when positive', () {
      expect(
        () => 1.shouldNotBePositive(),
        failsTest,
      );

      expect(
        () => positiveNumberCloseToZero.shouldNotBePositive(),
        failsTest,
      );
    });
  });

  group('negative', () {
    test('should return normally when negative', () {
      expect(
        () => (-1).shouldBeNegative(),
        returnsNormally,
      );

      expect(
        () => negativeNumberCloseToZero.shouldBeNegative(),
        returnsNormally,
      );
    });

    test('should fail when zero', () {
      expect(
        () => 0.shouldBePositive(),
        failsTest,
      );
    });

    test('should fail when positive', () {
      expect(
        () => 1.shouldBeNegative(),
        failsTest,
      );

      expect(
        () => positiveNumberCloseToZero.shouldBeNegative(),
        failsTest,
      );
    });
  });

  group('negative', () {
    test('should return normally when positive', () {
      expect(
        () => 1.shouldNotBeNegative(),
        returnsNormally,
      );

      expect(
        () => positiveNumberCloseToZero.shouldNotBeNegative(),
        returnsNormally,
      );
    });

    test('should return normally when zero', () {
      expect(
        () => 0.shouldNotBeNegative(),
        returnsNormally,
      );
    });

    test('should fail when negative', () {
      expect(
        () => (-1).shouldNotBeNegative(),
        failsTest,
      );

      expect(
        () => negativeNumberCloseToZero.shouldNotBeNegative(),
        failsTest,
      );
    });
  });

  group('zero', () {
    test('should return normally when zero', () {
      expect(
        () => 0.shouldBeZero(),
        returnsNormally,
      );
    });

    test('should fail when negative', () {
      expect(
        () => negativeNumberCloseToZero.shouldBeZero(),
        failsTest,
      );
    });

    test('should fail when positive', () {
      expect(
        () => positiveNumberCloseToZero.shouldBeZero(),
        failsTest,
      );
    });
  });

  group('not zero', () {
    test('should return normally when positive', () {
      expect(
        () => positiveNumberCloseToZero.shouldNotBeZero(),
        returnsNormally,
      );
    });

    test('should return normally when negative', () {
      expect(
        () => negativeNumberCloseToZero.shouldNotBeZero(),
        returnsNormally,
      );
    });

    test('should fail when zero', () {
      expect(
        () => 0.shouldNotBeZero(),
        failsTest,
      );
    });
  });

  group('near', () {
    test('should return normally when equal and no delta is given', () {
      expect(
        () => 1.shouldBeNear(1),
        returnsNormally,
      );
    });

    test('should return normally when the value is within lower delta bound',
        () {
      expect(
        () => 0.6.shouldBeNear(1, delta: 0.4),
        returnsNormally,
      );
    });

    test('should return normally when the value within to upper delta bound',
        () {
      expect(
        () => 1.4.shouldBeNear(1, delta: 0.4),
        returnsNormally,
      );
    });

    test('should fail when value is lower than expected by delta value', () {
      expect(
        () => 0.59.shouldBeNear(1, delta: 0.4),
        failsTest,
      );
    });

    test('should fail when value is greater than expected by delta value', () {
      expect(
        () => 1.41.shouldBeNear(1, delta: 0.4),
        failsTest,
      );
    });
  });

  group('in range', () {
    group('closed', () {
      test('should return normally when value is equal to lower bound', () {
        expect(
          () => 0.shouldBeInRange(lowerBound: 0, upperBound: 1),
          returnsNormally,
        );
      });

      test('should return normally when value is equal to upper bound', () {
        expect(
          () => 1.shouldBeInRange(lowerBound: 0, upperBound: 1),
          returnsNormally,
        );
      });

      test('should return normally when value is withing range', () {
        expect(
          () => 0.5.shouldBeInRange(lowerBound: 0, upperBound: 1),
          returnsNormally,
        );
      });

      test('should fail when value is smaller than lower bound', () {
        expect(
          () => negativeNumberCloseToZero.shouldBeInRange(
            lowerBound: 0,
            upperBound: 1,
          ),
          failsTest,
        );
      });

      test('should fail when value is greater than upper bound', () {
        expect(
          () => 1.0000000001.shouldBeInRange(
            lowerBound: 0,
            upperBound: 1,
          ),
          failsTest,
        );
      });
    });

    group('lower closed', () {
      test('should return normally when value is equal to lower bound', () {
        expect(
          () => 0.shouldBeInRange(lowerBound: 0),
          returnsNormally,
        );
      });

      test('should fail when value is smaller than lower bound', () {
        expect(
          () => negativeNumberCloseToZero.shouldBeInRange(lowerBound: 0),
          failsTest,
        );
      });

      test('should return normally when value is higher than the lower bound',
          () {
        expect(
          () => positiveNumberCloseToZero.shouldBeInRange(lowerBound: 0),
          returnsNormally,
        );

        expect(
          () => double.maxFinite.shouldBeInRange(lowerBound: 0),
          returnsNormally,
        );
      });
    });

    group('upper closed', () {
      test('should return normally when value is equal to upper bound', () {
        expect(
          () => 0.shouldBeInRange(upperBound: 0),
          returnsNormally,
        );
      });

      test('should fail when value is greater than upper bound', () {
        expect(
          () => positiveNumberCloseToZero.shouldBeInRange(upperBound: 0),
          failsTest,
        );
      });

      test('should return normally when value is lower than upper bound', () {
        expect(
          () => negativeNumberCloseToZero.shouldBeInRange(upperBound: 0),
          returnsNormally,
        );

        expect(
          () => (-double.maxFinite).shouldBeInRange(upperBound: 0),
          returnsNormally,
        );
      });
    });
  });

  group('not in range', () {
    group('closed', () {
      test('should fail when value is equal to lower bound', () {
        expect(
          () => 0.shouldNotBeInRange(lowerBound: 0, upperBound: 1),
          failsTest,
        );
      });

      test('should fail when value is equal to upper bound', () {
        expect(
          () => 1.shouldNotBeInRange(lowerBound: 0, upperBound: 1),
          failsTest,
        );
      });

      test('should fail when value is withing range', () {
        expect(
          () => 0.5.shouldNotBeInRange(lowerBound: 0, upperBound: 1),
          failsTest,
        );
      });

      test('should return normally when value is smaller than lower bound', () {
        expect(
          () => negativeNumberCloseToZero.shouldNotBeInRange(
            lowerBound: 0,
            upperBound: 1,
          ),
          returnsNormally,
        );
      });

      test('should return normally when value is greater than upper bound', () {
        expect(
          () => 1.0000000001.shouldNotBeInRange(
            lowerBound: 0,
            upperBound: 1,
          ),
          returnsNormally,
        );
      });
    });

    group('lower closed', () {
      test('should fail when value is equal to lower bound', () {
        expect(
          () => 0.shouldNotBeInRange(lowerBound: 0),
          failsTest,
        );
      });

      test('should return normally when value is smaller than lower bound', () {
        expect(
          () => negativeNumberCloseToZero.shouldNotBeInRange(lowerBound: 0),
          returnsNormally,
        );
      });

      test('should fail when value is higher than the lower bound', () {
        expect(
          () => positiveNumberCloseToZero.shouldNotBeInRange(lowerBound: 0),
          failsTest,
        );

        expect(
          () => double.maxFinite.shouldNotBeInRange(lowerBound: 0),
          failsTest,
        );
      });
    });

    group('upper closed', () {
      test('should fail when value is equal to upper bound', () {
        expect(
          () => 0.shouldNotBeInRange(upperBound: 0),
          failsTest,
        );
      });

      test('should return normally when value is greater than upper bound', () {
        expect(
          () => positiveNumberCloseToZero.shouldNotBeInRange(upperBound: 0),
          returnsNormally,
        );
      });

      test('should fail when value is lower than upper bound', () {
        expect(
          () => negativeNumberCloseToZero.shouldNotBeInRange(upperBound: 0),
          failsTest,
        );

        expect(
          () => (-double.maxFinite).shouldNotBeInRange(upperBound: 0),
          failsTest,
        );
      });
    });
  });
}
