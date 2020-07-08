The [Fluent Assertions](https://fluentassertions.com/) library written in Dart.

It uses Dart's [Extension Functions](https://dart.dev/guides/language/extension-methods) to provide a fluent wrapper around test assertions.

## Usage

#### Basic Assertions

These assertions are available for all objects.

##### Equality

```dart
'Hello'.shouldBeEqualTo('Hello');
```
```dart
'Hello'.shouldNotBeEqualTo('Word');
```

##### Reference equality

```dart
final me = Person(name: 'Karol');
final someoneElse = Person(name: 'Karol');
me.shouldBe(me);
me.shouldNotBe(someoneElse);
```

##### Subtypes

```dart
const num numberOfGirlsIAttract = 0;
numberOfGirlsIAttract.shouldBeInstanceOf<int>();
numberOfGirlsIAttract.shouldNotBeInstanceOf<double>();
```

##### Nullability

```dart
const hello = 'Hello';
hello.shouldNotBeNull();
```

```dart
const hello = null;
hello.shouldBeNull();
```

##### Booleans

```dart
const hasChildren = true;
hasChildren.shouldBeTrue();
hasChildren.shouldNotBeFalse();
```
```dart
const hasChildren = false;
hasChildren.shouldBeFalse();
hasChildren.shouldNotBeTrue();
```

#### Numerical Assertions

```dart
2.shouldBeGreaterOrEqualTo(2);
```

```dart
2.shouldBeGreaterThan(1);
```

```dart
2.shouldBeLessOrEqualTo(2);
```

```dart
1.shouldBeLessThan(2);
```

```dart
1.shouldBePositive();
1.shouldNotBeNegative();
```

```dart
(-1).shouldBeNegative();
(-1).shouldNotBePositive();
```

```dart
0.shouldBeZero();
1.shouldNotBeZero();
```

#### CharSequence Assertions

#### Collection Assertions

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/klisiewicz/fluent-assertions/issues).

## Author
- [Karol Lisiewicz](https://github.com/klisiewicz)
