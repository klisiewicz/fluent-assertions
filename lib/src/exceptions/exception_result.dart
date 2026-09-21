import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Holds the caught exception of type [E] and provides fluent assertions
/// for its message and cause.
class ExceptionResult<E extends Object> {
  /// The caught exception.
  final E exception;

  /// The stack trace captured when the exception was thrown.
  final StackTrace stackTrace;

  /// Creates a new [ExceptionResult] with the caught [exception] and [stackTrace].
  ExceptionResult(this.exception, this.stackTrace);

  /// Asserts that the exception's message equals [expectedMessage].
  ExceptionResult<E> withMessage(String expectedMessage) {
    final msg = _extractMessage(exception);
    checkExpect(
      msg,
      equals(expectedMessage),
      reason: 'Expected exception message "$expectedMessage", but was "$msg".',
    );
    return this;
  }

  /// Asserts that the exception's message matches [pattern].
  ExceptionResult<E> withMessageMatching(Pattern pattern) {
    final msg = _extractMessage(exception);
    checkExpect(
      msg,
      matches(pattern),
      reason: 'Expected exception message to match $pattern, but was "$msg".',
    );
    return this;
  }

  /// Asserts that the exception's message contains [substring].
  ExceptionResult<E> withMessageContaining(String substring) {
    final msg = _extractMessage(exception);
    checkExpect(
      msg.contains(substring),
      isTrue,
      reason:
          'Expected exception message to contain "$substring", but was "$msg".',
    );
    return this;
  }

  /// Asserts that the exception has a cause of type [C].
  ExceptionResult<E> withCause<C extends Object>() {
    final cause = _extractCause(exception);
    checkExpect(
      cause,
      isA<C>(),
      reason:
          'Expected exception cause to be of type $C, but was ${cause?.runtimeType} ($cause).',
    );
    return this;
  }

  /// Asserts that the exception's cause matches the given [predicate].
  ExceptionResult<E> withCauseMatching(bool Function(Object? cause) predicate) {
    final cause = _extractCause(exception);
    checkExpect(
      predicate(cause),
      isTrue,
      reason: 'Expected exception cause to match predicate, but was $cause.',
    );
    return this;
  }
}

/// Async counterpart to [ExceptionResult] for asynchronous assertions.
class AsyncExceptionResult<E extends Object> {
  /// The caught exception.
  final E exception;

  /// The stack trace captured when the exception was thrown.
  final StackTrace stackTrace;

  /// Creates a new [AsyncExceptionResult].
  AsyncExceptionResult(this.exception, this.stackTrace);

  /// Asserts that the exception's message equals [expectedMessage].
  AsyncExceptionResult<E> withMessage(String expectedMessage) {
    final msg = _extractMessage(exception);
    checkExpect(
      msg,
      equals(expectedMessage),
      reason: 'Expected exception message "$expectedMessage", but was "$msg".',
    );
    return this;
  }

  /// Asserts that the exception's message matches [pattern].
  AsyncExceptionResult<E> withMessageMatching(Pattern pattern) {
    final msg = _extractMessage(exception);
    checkExpect(
      msg,
      matches(pattern),
      reason: 'Expected exception message to match $pattern, but was "$msg".',
    );
    return this;
  }

  /// Asserts that the exception's message contains [substring].
  AsyncExceptionResult<E> withMessageContaining(String substring) {
    final msg = _extractMessage(exception);
    checkExpect(
      msg.contains(substring),
      isTrue,
      reason:
          'Expected exception message to contain "$substring", but was "$msg".',
    );
    return this;
  }

  /// Asserts that the exception has a cause of type [C].
  AsyncExceptionResult<E> withCause<C extends Object>() {
    final cause = _extractCause(exception);
    checkExpect(
      cause,
      isA<C>(),
      reason:
          'Expected exception cause to be of type $C, but was ${cause?.runtimeType} ($cause).',
    );
    return this;
  }
}

String _extractMessage(Object exception) {
  try {
    final dynamic dyn = exception;
    final dynamic msg = dyn.message;
    if (msg != null) return msg.toString();
  } catch (_) {}
  return exception.toString();
}

Object? _extractCause(Object exception) {
  try {
    final dynamic dyn = exception;
    return dyn.cause ?? dyn.inner ?? dyn.error;
  } catch (_) {}
  return null;
}
