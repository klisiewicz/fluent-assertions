import 'package:test/test.dart';

final Matcher failsTest = throwsA(const TypeMatcher<TestFailure>());
