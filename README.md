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

```dart
0.999.shouldBeNear(1, delta: 0.01);
```

```dart
0.shouldNotBeInRange(lowerBound: 1, upperBound: 6);
1.shouldBeInRange(lowerBound: 1, upperBound: 6);
```

#### String Assertions

```dart
'Flutter'.shouldBeEqualToIgnoringCase('FLUTTER');
'Flutter'.shouldNotBeEqualToIgnoringCase('Xamarin');
```

```dart
'Flutter rules'.shouldStartWith('Flutter');
'Flutter rules'.shouldNotStartWith('Xamarin');
```

```dart
'Flutter rules'.shouldStartWithIgnoringCase('FLUTTER');
'Flutter rules'.shouldNotStartWithIgnoringCase('Xamarin');
```

```dart
'I love Flutter'.shouldEndWith('Flutter');
'I love Flutter'.shouldNotEndWith('Xamarin');
```

```dart
'I love Flutter'.shouldEndWithIgnoringCase('flutter');
'I love Flutter'.shouldNotEndWithIgnoringCase('xamarin');
```

```dart
'I love Flutter'.shouldContain('love');
'I love Flutter'.shouldNotContain('hate');
```

```dart
'I love Flutter'.shouldContainIgnoringCase('LOVE');
'I love Flutter'.shouldNotContainIgnoringCase('HATE');
```

```dart
'I love Flutter'.shouldContainAll(['Flutter', 'love']);
'I love Flutter'.shouldContainAllIgnoringCase(['flutter', 'love']);
```

```dart
'I love Flutter'.shouldContainAllInOrder(['love', 'Flutter']);
'I love Flutter'.shouldContainAllInOrderIgnoringCase(['Love', 'Flutter']);
```

```dart
'12345'.shouldMatch(r'\d');
'Hello'.shouldNotMatch(r'\d');
```

```dart
''.shouldBeEmpty()
'name'.shouldNotBeEmpty()
```

```dart
''.shouldBeNullOrEmpty()
'name'.shouldNotBeNullOrEmpty()
```

```dart
' '.shouldBeBlank()
'name'.shouldNotBeBlank()
```

```dart
' '.shouldBeNullOrBlank()
'name'.shouldNotBeNullOrBlank()
```

#### Iterable Assertions

```dart
['Flutter', 'React Native', 'Jetpack Compose'].shouldContain('Flutter');
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainIgnoringCase('flutter');
```

```dart
['Flutter', 'React Native', 'Jetpack Compose'].shouldNotContain('Vue');
['Flutter', 'React Native', 'Jetpack Compose'].shouldNotContainIgnoringCase('vue');
```

```dart
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAny(['Flutter', 'Vue']);
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAnyIgnoringCase(['react native']);
```

```dart
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainNone(['Angular', 'Vue'])
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainNoneIgnoringCase(['angular', 'vue']);
```

```dart
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAll(['Jetpack Compose', 'React Native']);
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAllIgnoringCase(['jetpack compose', 'react native']);
```

```dart
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAllInOrder(['Flutter', 'React Native']);
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAllInOrderIgnoringCase(['flutter', 'react native']);
```

```dart
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAllThat((framework) => framework.startsWith(RegExp('[A-Z]')));
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainAnyThat((framework) => framework.contains('React'));
['Flutter', 'React Native', 'Jetpack Compose'].shouldContainNoneThat((framework) => framework.isEmpty);
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/klisiewicz/fluent-assertions/issues).

## Author
- [Karol Lisiewicz](https://github.com/klisiewicz)
