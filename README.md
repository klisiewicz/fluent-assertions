The "Fluent Assertions" library written specifically for Dart.

It uses Dart's Extension Functions to provide a fluent wrapper around test assertions.

## Usage

#### Basic Assertions

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

#### Numerical Assertions

#### CharSequence Assertions

#### Collection Assertions

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

## Author
- [Karol Lisiewicz](https://github.com/klisiewicz)
