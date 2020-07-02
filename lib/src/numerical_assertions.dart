import 'package:test/test.dart';

extension NumericalAssertions on num {
  /// Asserts that the value is greater or equal to [expected].
  void shouldBeGreaterOrEqualTo(num expected) =>
      expect(this >= expected, isTrue);
}
