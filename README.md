The [Fluent Assertions](https://fluentassertions.com/) library written in Dart.

It uses Dart's [Extension Functions](https://dart.dev/guides/language/extension-methods) to provide a fluent wrapper around test assertions.

## Usage

#### Basic Assertions

This assertions are available for all objects:

##### Equality

```dart
'Hello'.shouldBeEqualTo('Hello');
```
```dart
'Hello'.shouldNotBeEqualTo('Word');
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

#### Booleans
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

#### CharSequence Assertions

#### Collection Assertions

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

## Author
- [Karol Lisiewicz](https://github.com/klisiewicz)
