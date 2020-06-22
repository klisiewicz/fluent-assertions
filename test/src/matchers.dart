import 'package:test/test.dart';

final Matcher failsTest = throwsA(TypeMatcher<TestFailure>());
