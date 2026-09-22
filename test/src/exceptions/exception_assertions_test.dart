import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

import '../util/matchers.dart';

class CustomException implements Exception {
  final String message;
  final Object? cause;

  CustomException(this.message, [this.cause]);

  @override
  String toString() => 'CustomException: $message (cause: $cause)';
}

void main() {
  group('SyncFunctionAssertions', () {
    test(
        'shouldThrow returns ExceptionResult when expected exception is thrown',
        () {
      final result = (() => throw const FormatException('invalid format'))
          .shouldThrow<FormatException>();
      expect(result.exception.message, equals('invalid format'));
    });

    test('shouldThrow fails when different exception is thrown', () {
      expect(
        () => (() => throw ArgumentError('bad arg'))
            .shouldThrow<FormatException>(),
        failsTest,
      );
    });

    test('shouldThrow fails when function returns normally', () {
      expect(
        () => (() {}).shouldThrow<FormatException>(),
        failsTest,
      );
    });

    test('shouldNotThrow returns normally when no exception is thrown', () {
      expect(
        () => (() {}).shouldNotThrow<FormatException>(),
        returnsNormally,
      );
    });

    test('shouldNotThrow returns normally when a different exception is thrown',
        () {
      expect(
        () => (() => throw ArgumentError()).shouldNotThrow<FormatException>(),
        returnsNormally,
      );
    });

    test('shouldNotThrow fails when expected exception is thrown', () {
      expect(
        () => (() => throw const FormatException('fail'))
            .shouldNotThrow<FormatException>(),
        failsTest,
      );
    });

    test('shouldNotThrowAny returns normally when no exception is thrown', () {
      expect(
        () => (() {}).shouldNotThrowAny(),
        returnsNormally,
      );
    });

    test('shouldNotThrowAny fails when any exception is thrown', () {
      expect(
        () => (() => throw Exception('error')).shouldNotThrowAny(),
        failsTest,
      );
    });

    test('invoking helper wraps action cleanly', () {
      expect(
        () => invoking(() => throw RangeError('out of range'))
            .shouldThrow<RangeError>(),
        returnsNormally,
      );
    });

    group('ExceptionResult chaining', () {
      test('withMessage passes when message matches exactly', () {
        expect(
          () => (() => throw const FormatException('bad format'))
              .shouldThrow<FormatException>()
              .withMessage('bad format'),
          returnsNormally,
        );
      });

      test('withMessage fails when message differs', () {
        expect(
          () => (() => throw const FormatException('bad format'))
              .shouldThrow<FormatException>()
              .withMessage('different message'),
          failsTest,
        );
      });

      test('withMessageMatching passes when regex matches', () {
        expect(
          () => (() => throw const FormatException('error code: 404'))
              .shouldThrow<FormatException>()
              .withMessageMatching(RegExp(r'\d+')),
          returnsNormally,
        );
      });

      test('withMessageContaining passes when substring exists', () {
        expect(
          () => (() => throw const FormatException('connection timed out'))
              .shouldThrow<FormatException>()
              .withMessageContaining('timed out'),
          returnsNormally,
        );
      });

      test('withCause passes when cause is of expected type', () {
        final inner = ArgumentError('bad input');
        expect(
          () => (() => throw CustomException('outer', inner))
              .shouldThrow<CustomException>()
              .withCause<ArgumentError>(),
          returnsNormally,
        );
      });

      test('withCause fails when cause is missing or of different type', () {
        expect(
          () => (() => throw CustomException('outer', 'string cause'))
              .shouldThrow<CustomException>()
              .withCause<ArgumentError>(),
          failsTest,
        );
      });

      test('withCauseMatching passes when predicate returns true', () {
        expect(
          () => (() => throw CustomException('outer', 42))
              .shouldThrow<CustomException>()
              .withCauseMatching((cause) => cause == 42),
          returnsNormally,
        );
      });
    });
  });

  group('AsyncFunctionAssertions', () {
    test('async shouldThrow passes when expected exception thrown', () async {
      Future<void> asyncAction() async {
        await Future<void>.delayed(const Duration(milliseconds: 1));
        throw const FormatException('async error');
      }

      final result = await asyncAction.shouldThrow<FormatException>();
      expect(result.exception.message, equals('async error'));
    });

    test('async shouldThrow fails when function completes normally', () {
      Future<int> asyncAction() async => 42;
      expect(
        asyncAction.shouldThrow<FormatException>(),
        failsTest,
      );
    });

    test('async shouldNotThrow passes when no exception thrown', () {
      Future<int> asyncAction() async => 42;
      expect(
        asyncAction.shouldNotThrow<FormatException>(),
        completes,
      );
    });

    test('async shouldNotThrowAny passes when completed normally', () {
      Future<String> asyncAction() async => 'success';
      expect(
        asyncAction.shouldNotThrowAny(),
        completes,
      );
    });

    test('FutureExtensionAssertions directly on Future instance', () async {
      final future = Future<void>.error(const FormatException('future error'));
      final result = await future.shouldThrow<FormatException>();
      result.withMessage('future error');
    });
  });
}
