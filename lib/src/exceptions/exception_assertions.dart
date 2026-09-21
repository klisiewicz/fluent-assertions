import 'dart:async';
import 'package:fluent_assertions/src/exceptions/exception_result.dart';
import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Helper function to create a fluent assertion block on an action.
///
/// Example:
/// ```dart
/// invoking(() => doSomething()).shouldThrow<ArgumentError>();
/// ```
R Function() invoking<R>(R Function() action) => action;

/// Extension on synchronous zero-argument functions for exception assertions.
extension SyncFunctionAssertions<R> on R Function() {
  /// Asserts that executing this function throws an exception of type [E].
  ///
  /// Returns an [ExceptionResult] which can be used to assert properties of the
  /// thrown exception, such as its message or cause.
  ExceptionResult<E> shouldThrow<E extends Object>() {
    try {
      this();
    } on E catch (e, st) {
      return ExceptionResult<E>(e, st);
    } catch (other) {
      expect(
        other,
        isA<E>(),
        reason:
            'Expected function to throw $E, but threw ${other.runtimeType} ($other).',
      );
    }
    expect(
      null,
      isA<E>(),
      reason: 'Expected function to throw $E, but returned normally.',
    );
    throw StateError('Unreachable');
  }

  /// Asserts that executing this function does not throw an exception of type [E].
  void shouldNotThrow<E extends Object>() {
    try {
      this();
    } on E catch (e) {
      checkExpect(
        e,
        isNot(isA<E>()),
        reason: 'Expected function to not throw $E, but threw $e.',
      );
    } catch (_) {
      // Different exception thrown, passes.
    }
  }

  /// Asserts that executing this function completes without throwing any exception.
  void shouldNotThrowAny() {
    try {
      this();
    } catch (e) {
      checkExpect(
        e,
        isNull,
        reason:
            'Expected function to not throw any exception, but threw ${e.runtimeType} ($e).',
      );
    }
  }
}

/// Extension on asynchronous functions for exception assertions.
extension AsyncFunctionAssertions<R> on Future<R> Function() {
  /// Asserts that the asynchronous function throws an exception of type [E].
  Future<AsyncExceptionResult<E>> shouldThrow<E extends Object>() async {
    try {
      await this();
    } on E catch (e, st) {
      return AsyncExceptionResult<E>(e, st);
    } catch (other) {
      expect(
        other,
        isA<E>(),
        reason:
            'Expected async function to throw $E, but threw ${other.runtimeType} ($other).',
      );
    }
    expect(
      null,
      isA<E>(),
      reason: 'Expected async function to throw $E, but returned normally.',
    );
    throw StateError('Unreachable');
  }

  /// Asserts that the asynchronous function does not throw an exception of type [E].
  Future<void> shouldNotThrow<E extends Object>() async {
    try {
      await this();
    } on E catch (e) {
      checkExpect(
        e,
        isNot(isA<E>()),
        reason: 'Expected async function to not throw $E, but threw $e.',
      );
    } catch (_) {
      // Different exception thrown, passes.
    }
  }

  /// Asserts that the asynchronous function completes without throwing any exception.
  Future<void> shouldNotThrowAny() async {
    try {
      await this();
    } catch (e) {
      checkExpect(
        e,
        isNull,
        reason:
            'Expected async function to not throw any exception, but threw ${e.runtimeType} ($e).',
      );
    }
  }
}

/// Extension on [Future] values for exception assertions.
extension FutureExtensionAssertions<R> on Future<R> {
  /// Asserts that this [Future] completes with an exception of type [E].
  Future<AsyncExceptionResult<E>> shouldThrow<E extends Object>() =>
      (() => this).shouldThrow<E>();

  /// Asserts that this [Future] does not complete with an exception of type [E].
  Future<void> shouldNotThrow<E extends Object>() =>
      (() => this).shouldNotThrow<E>();

  /// Asserts that this [Future] completes without throwing any exception.
  Future<void> shouldNotThrowAny() => (() => this).shouldNotThrowAny();
}
