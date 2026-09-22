import 'dart:async';
import 'package:test/test.dart';

/// Context to accumulate failures when running inside an [assertSoftly] block.
class SoftAssertionContext {
  final List<TestFailure> failures = [];
}

/// Zone key used to retrieve the active [SoftAssertionContext].
const Symbol softAssertionZoneKey = #_fluentSoftAssertions;

/// Delegates assertion verification to [expect], intercepting [TestFailure]
/// if executed within a soft assertion zone.
void checkExpect(
  dynamic actual,
  dynamic matcher, {
  String? reason,
  dynamic skip,
}) {
  final softContext =
      Zone.current[softAssertionZoneKey] as SoftAssertionContext?;
  if (softContext != null) {
    try {
      expect(actual, matcher, reason: reason, skip: skip);
    } on TestFailure catch (failure) {
      softContext.failures.add(failure);
    }
  } else {
    expect(actual, matcher, reason: reason, skip: skip);
  }
}
