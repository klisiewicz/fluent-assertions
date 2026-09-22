# fluent_assertions

[![pub package](https://img.shields.io/badge/pub-v0.5.1-blue.svg)](https://pub.dev/packages/fluent_assertions)
[![license](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A comprehensive, idiomatic Dart port of the popular [Fluent Assertions](https://fluentassertions.com/) library.

`fluent_assertions` leverages Dart's Extension Methods to turn test assertions into natural, readable sentences. Under the hood, all assertions map directly to the official Dart **`package:test/expect.dart` (Matchers)** API, guaranteeing 100% compatibility with standard Dart and Flutter test runners, IDE test explorers, and CI/CD pipelines.

---

## Installation

Add `fluent_assertions` as a dev dependency in your `pubspec.yaml`:

```yaml
dev_dependencies:
  test: ^1.25.0
  fluent_assertions: ^0.5.1
```

Then import the library in your test files:

```dart
import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';
```

---

## Features & Usage Guide

### 1. Basic Assertions

Available on all objects (`T?`).

```dart
// Equality
'Hello'.shouldBeEqualTo('Hello');
'Hello'.shouldNotBeEqualTo('World');

// Identity (referential equality)
final person = Person(name: 'Karol');
person.shouldBe(person);
person.shouldNotBe(Person(name: 'Karol'));

// Nullability & Type Narrowing
final String? maybeName = 'Karol';
final name = maybeName.shouldNotBeNull(); // Returns non-nullable String
name.shouldHaveLength(5);

const String? nullValue = null;
nullValue.shouldBeNull();

// Subtypes
const num score = 10;
score.shouldBeInstanceOf<int>();
score.shouldNotBeInstanceOf<double>();

// Runtime Class / Type
1.shouldHaveTheSameClassAs(2);
1.shouldNotHaveTheSameClassAs('1');

// Membership in collection
2.shouldBeIn([1, 2, 3]);
5.shouldNotBeIn([1, 2, 3]);

// Booleans
true.shouldBeTrue();
true.shouldNotBeFalse();
false.shouldBeFalse();
false.shouldNotBeTrue();

// Character digits
'5'.shouldBeDigit();
'a'.shouldNotBeDigit();
```

---

### 2. Numerical Assertions

Available on `num`, `int`, and `double`.

```dart
// Comparisons
10.shouldBeGreaterThan(5);
10.shouldNotBeGreaterThan(15);
10.shouldBeGreaterOrEqualTo(10);
5.shouldBeLessThan(10);
5.shouldNotBeLessThan(2);
5.shouldBeLessOrEqualTo(5);

// Sign and zero
42.shouldBePositive();
(-1).shouldBeNegative();
0.shouldBeZero();
10.shouldNotBeZero();

// Ranges
15.shouldBeInRange(lowerBound: 10, upperBound: 20);
5.shouldNotBeInRange(lowerBound: 10, upperBound: 20);

// Close-to / Delta tolerance (NaN parity: NaN is considered near NaN)
3.14159.shouldBeNear(3.14, delta: 0.01);
10.shouldNotBeNear(20, delta: 1);
double.nan.shouldBeNear(double.nan);
```

---

### 3. String Assertions

Available on `String` and `String?`.

```dart
// Prefix and Suffix
'Flutter'.shouldStartWith('Flu');
'Flutter'.shouldStartWithIgnoringCase('flu');
'Flutter'.shouldNotStartWith('Dart');

'Flutter'.shouldEndWith('ter');
'Flutter'.shouldEndWithIgnoringCase('TER');
'Flutter'.shouldNotEndWith('app');

// Containment
'Hello World'.shouldContain('World');
'Hello World'.shouldContainIgnoringCase('world');
'Hello World'.shouldNotContain('Dart');

// Multi-substring checks
'The quick brown fox'.shouldContainAll(['quick', 'fox']);
'The quick brown fox'.shouldContainAllIgnoringCase(['QUICK', 'FOX']);
'The quick brown fox'.shouldContainAllInOrder(['quick', 'brown', 'fox']);
'The quick brown fox'.shouldContainAny(['dog', 'fox']);
'The quick brown fox'.shouldContainNone(['cat', 'bear']);

// Patterns & Regex
'user123'.shouldMatch(RegExp(r'^[a-z]+[0-9]+$'));
'user123'.shouldNotMatch(RegExp(r'^[0-9]+$'));

// Blank & Empty
''.shouldBeEmpty();
'hello'.shouldNotBeEmpty();
'   '.shouldBeBlank();
'hello'.shouldNotBeBlank();

// Length & Numeric
'hello'.shouldHaveLength(5);
'123.45'.shouldBeNumeric();
'abc'.shouldNotBeNumeric();

// Nullable Strings (String?)
const String? emptyStr = '';
emptyStr.shouldBeNullOrEmpty();
'hello'.shouldNotBeNullOrEmpty();

const String? blankStr = '   ';
blankStr.shouldBeNullOrBlank();
'hello'.shouldNotBeNullOrBlank();
```

---

### 4. Collection & Iterable Assertions

Available on `Iterable<T>`.

```dart
final list = [1, 2, 3, 4];

// Size & Emptiness
list.shouldHaveSize(4);
list.shouldHaveCount(4); // Alias
[42].shouldHaveSingleItem();
list.shouldNotBeEmpty();
[].shouldBeEmpty();

// Element Containment
list.shouldContain(2);
list.shouldNotContain(99);
list.shouldContainAll([1, 4]);
list.shouldNotContainAll([1, 99]);
list.shouldContainAllInOrder([1, 2, 4]);
list.shouldContainAny([3, 99]);
list.shouldContainNone([88, 99]);

// Unordered Equality (frequency-counted)
[1, 2, 3].shouldContainSame([3, 1, 2]);
[1, 2, 3].shouldEqualUnordered([3, 1, 2]); // Alias
[1, 2, 3].shouldNotContainSame([1, 2, 4]);

// Sorting
[1, 2, 3, 4].shouldBeSorted();
[4, 3, 2, 1].shouldBeSortedAccordingTo((a, b) => b.compareTo(a));
[1, 3, 2].shouldNotBeSorted();

// Predicates
list.shouldContainAnyThat((x) => x > 3);
list.shouldContainSome((x) => x > 3); // Alias
list.shouldContainAllThat((x) => x > 0);
list.shouldMatchAllWith((x) => x > 0); // Alias
list.shouldContainNoneThat((x) => x < 0);

// Element Type Assertions
final mixed = <Object>[1, 2, 3];
mixed.shouldAllBeInstanceOf<int>();
mixed.shouldNoneBeInstanceOf<String>();

// Case-insensitive String Iterables
['Alice', 'Bob'].shouldContainIgnoringCase('alice');
['Alice', 'Bob'].shouldContainAllIgnoringCase(['alice', 'BOB']);
```

---

### 5. Map Assertions

Available on `Map<K, V>`.

```dart
final user = {'id': 1, 'username': 'karol', 'active': true};

// Keys and Values
user.shouldHaveKey('username');
user.shouldNotHaveKey('password');
user.shouldHaveValue('karol');
user.shouldNotHaveValue('admin');

// Key-Value Pairs
user.shouldContain('id', 1);
user.shouldNotContain('id', 99);
user.shouldContainEntry(const MapEntry('active', true));

// Full Unordered Map Equality
user.shouldContainSame({'username': 'karol', 'id': 1, 'active': true});
user.shouldNotContainSame({'id': 1});

// Size & Emptiness
user.shouldHaveSize(3);
user.shouldNotBeEmpty();
{}.shouldBeEmpty();
```

---

### 6. Exception Assertions

Supports both synchronous and asynchronous functions.

#### Synchronous Functions

```dart
// Using invoking helper
invoking(() => throw FormatException('Invalid JSON'))
    .shouldThrow<FormatException>()
    .withMessage('Invalid JSON')
    .withMessageContaining('JSON')
    .withMessageMatching(RegExp(r'JSON$'));

// Asserting no exception
(() => 2 + 2).shouldNotThrow<FormatException>();
(() => 2 + 2).shouldNotThrowAny();
```

#### Exception Causes

```dart
invoking(() => throw CustomException('Network error', SocketException('timeout')))
    .shouldThrow<CustomException>()
    .withCause<SocketException>();
```

#### Asynchronous Functions & Futures

```dart
// On async functions
Future<void> fetchUser() async {
  throw const FormatException('user not found');
}

final result = await fetchUser.shouldThrow<FormatException>();
result.withMessage('user not found');

// On Future instances directly
final future = Future<void>.error(ArgumentError('bad id'));
await future.shouldThrow<ArgumentError>();
```

---

### 7. Temporal Assertions (`DateTime` & `Duration`)

Port of Kluent's `java.time` assertions.

```dart
final eventTime = DateTime(2025, 6, 15, 10, 30);

// Relative positioning
eventTime.shouldBeAfter(DateTime(2025, 1, 1));
eventTime.shouldNotBeAfter(DateTime(2026, 1, 1));
eventTime.shouldBeBefore(DateTime(2025, 12, 31));

// Same moment (handles different timezones properly)
final utc = DateTime.utc(2025, 6, 15, 10, 30);
utc.shouldBeAtSameMomentAs(utc.toLocal());

// Ranges
eventTime.shouldBeBetween(DateTime(2025, 1, 1), DateTime(2025, 12, 31));

// Calendar breakdown
eventTime.shouldBeInYear(2025);
eventTime.shouldBeInMonth(6);
eventTime.shouldBeOnDay(15);
eventTime.shouldBeOnDate(DateTime(2025, 6, 15)); // Ignores hours/minutes/seconds

// Tolerance
eventTime.shouldBeNear(
  DateTime(2025, 6, 15, 10, 35),
  delta: const Duration(minutes: 10),
);

// Duration Assertions
const timeout = Duration(seconds: 30);
timeout.shouldBeLongerThan(const Duration(seconds: 15));
timeout.shouldBeShorterThan(const Duration(seconds: 60));
timeout.shouldBeEqualTo(const Duration(milliseconds: 30000));
timeout.shouldBePositive();
timeout.shouldNotBeNegative();
timeout.shouldNotBeZero();
```

---

### 8. Deep Equivalency Assertions

Recursively compares complex nested maps, lists, sets, date-times, and objects.

```dart
final responseA = {
  'status': 200,
  'data': [
    {'id': 1, 'tags': {'a', 'b'}},
    {'id': 2, 'tags': {'c'}},
  ],
};

final responseB = {
  'status': 200,
  'data': [
    {'id': 1, 'tags': {'b', 'a'}}, // Sets compared order-insensitively
    {'id': 2, 'tags': {'c'}},
  ],
};

responseA.shouldBeEquivalentTo(responseB);
```

---

### 9. Soft Assertions (`assertSoftly`)

`assertSoftly` executes multiple assertions within a block, collecting all failures instead of terminating at the first failure. If any assertions fail, a single consolidated failure report is thrown.

```dart
assertSoftly(() {
  adult.name.shouldBeEqualTo('Karol');
  adult.age.shouldBeGreaterThan(25);
  adult.isAdult.shouldBeTrue();
});
```

If multiple assertions fail:
```
The following 2 assertions failed:
1) Expected: <50>
     Actual: <30>
2) Expected: 'Alice'
     Actual: 'Karol'
```

For async blocks, use `assertSoftlyAsync`:

```dart
await assertSoftlyAsync(() async {
  await fetchDetails();
  data.shouldNotBeNull();
  data.shouldHaveSize(3);
});
```

---

### 10. Fluid Chaining

All assertion methods return the receiver (`this`), allowing multiple assertions to be fluently chained in a single statement:

```dart
42
  .shouldBePositive()
  .shouldBeGreaterThan(10)
  .shouldBeLessThan(50)
  .shouldBeInRange(lowerBound: 40, upperBound: 45)
  .shouldNotBeZero();

'Flutter'
  .shouldNotBeEmpty()
  .shouldStartWith('Flu')
  .shouldEndWith('ter')
  .shouldContain('utt')
  .shouldHaveLength(7);

[1, 2, 3]
  .shouldNotBeEmpty()
  .shouldHaveSize(3)
  .shouldContain(2)
  .shouldBeSorted();
```

---

## Running Tests

To run the complete test suite:

```bash
dart test
```

To run the example file:

```bash
dart test example/fluent_assertions_example.dart
```

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
