import 'dart:async';
import 'package:fluent_assertions/src/internal/check_expect.dart';
import 'package:test/test.dart';

/// Runs a synchronous block of assertions softly.
///
/// Any assertion failures occurring during [action] are collected rather than
/// terminating execution immediately. Once [action] completes, if any assertions
/// failed, a consolidated [TestFailure] listing all failures is thrown.
R assertSoftly<R>(R Function() action) {
  final context = SoftAssertionContext();
  final result = runZoned(
    () {
      try {
        return action();
      } catch (e) {
        if (e is TestFailure) {
          context.failures.add(e);
          return null as R;
        }
        rethrow;
      }
    },
    zoneValues: {softAssertionZoneKey: context},
  );

  if (context.failures.isNotEmpty) {
    if (context.failures.length == 1) {
      throw context.failures.first;
    }
    final buffer = StringBuffer();
    buffer.writeln(
      'The following ${context.failures.length} assertions failed:',
    );
    for (var i = 0; i < context.failures.length; i++) {
      buffer.writeln('${i + 1}) ${context.failures[i].message}');
    }
    throw TestFailure(buffer.toString().trimRight());
  }

  return result;
}

/// Runs an asynchronous block of assertions softly.
///
/// Any assertion failures occurring during [action] are collected rather than
/// terminating execution immediately. Once [action] completes, if any assertions
/// failed, a consolidated [TestFailure] listing all failures is thrown.
Future<R> assertSoftlyAsync<R>(Future<R> Function() action) async {
  final context = SoftAssertionContext();
  final result = await runZoned(
    () async {
      try {
        return await action();
      } catch (e) {
        if (e is TestFailure) {
          context.failures.add(e);
          return null as R;
        }
        rethrow;
      }
    },
    zoneValues: {softAssertionZoneKey: context},
  );

  if (context.failures.isNotEmpty) {
    if (context.failures.length == 1) {
      throw context.failures.first;
    }
    final buffer = StringBuffer();
    buffer.writeln(
      'The following ${context.failures.length} assertions failed:',
    );
    for (var i = 0; i < context.failures.length; i++) {
      buffer.writeln('${i + 1}) ${context.failures[i].message}');
    }
    throw TestFailure(buffer.toString().trimRight());
  }

  return result;
}
