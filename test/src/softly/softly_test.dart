import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

void main() {
  group('assertSoftly', () {
    test('passes when all assertions in block pass', () {
      expect(
        () => assertSoftly(() {
          1.shouldBeEqualTo(1);
          'hello'.shouldStartWith('h');
          true.shouldBeTrue();
        }),
        returnsNormally,
      );
    });

    test('returns block result', () {
      final value = assertSoftly(() {
        1.shouldBeEqualTo(1);
        return 42;
      });
      expect(value, equals(42));
    });

    test('collects multiple failures and throws combined failure', () {
      try {
        assertSoftly(() {
          1.shouldBeEqualTo(2);
          'hello'.shouldStartWith('z');
          true.shouldBeFalse();
        });
        fail('Expected assertSoftly to throw TestFailure');
      } on TestFailure catch (e) {
        expect(e.message, contains('The following 3 assertions failed:'));
        expect(e.message, contains('1)'));
        expect(e.message, contains('2)'));
        expect(e.message, contains('3)'));
      }
    });

    test('throws single failure directly when exactly 1 assertion fails', () {
      expect(
        () => assertSoftly(() {
          1.shouldBeEqualTo(1);
          1.shouldBeEqualTo(2);
        }),
        failsTest,
      );
    });

    test('hard fails immediately on shouldNotBeNull when null', () {
      var executedSecond = false;
      try {
        assertSoftly(() {
          const String? nullStr = null;
          nullStr.shouldNotBeNull();
          executedSecond = true;
        });
      } on TestFailure catch (_) {
        // Expected
      }
      expect(executedSecond, isFalse);
    });
  });

  group('assertSoftlyAsync', () {
    test('passes when all async assertions pass', () async {
      await assertSoftlyAsync(() async {
        await Future<void>.delayed(const Duration(milliseconds: 1));
        1.shouldBeEqualTo(1);
      });
    });

    test('collects multiple async failures', () async {
      try {
        await assertSoftlyAsync(() async {
          1.shouldBeEqualTo(2);
          'abc'.shouldStartWith('x');
        });
        fail('Expected assertSoftlyAsync to throw TestFailure');
      } on TestFailure catch (e) {
        expect(e.message, contains('The following 2 assertions failed:'));
      }
    });
  });
}
