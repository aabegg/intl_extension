<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Translations without boilerplate. With an extension for strings, corresponding ARB files are created via code generator, which in turn are converted into localization files with gen-l10n. The corresponding translation is loaded by the string extension directly from the localization file in the corresponding language.

## Features

- Normal strings with and without parameters
- Select strings with and without parameters
- Plural strings with and without parameters


## How to use

### Install

To use intl_extension you need to install it by adding them to your `pubspec.yaml`

```console
$ flutter pub add intl_extension
```


### Extract and Generate

At any time, the following command can be used to extract the strings and create the translation files:

```console
$ flutter pub run intl_extension:build
```

> Run this command first after you have installed the package


### Initialize

Add `WidgetsFlutterBinding.ensureInitialized();` and `IntlLocalizations.init(IntlConfig());` to the main function to initialize the translation service.
The `IntlConfig()` was created by the code generation previously.

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  IntlLocalizations.init(IntlConfig());

  runApp(const MyApp());
}
```

### Translate strings

You can easily translate a string by appending intl().

```dart
Text('This is my address'.intl());
```

If the string contains parameters they can be passed to `intl()` as `Map<String, String>`.

```dart
Text('My address is {address}'.intl({"address": "CWC8+R9 Mountain View, Kalifornien, USA"}));
```

> If the string is not yet included in the translations, it will be returned or displayed untranslated


When you have marked new strings for translation, you need to run the above command to extract and generate the translation files. After that you need to restart the app. Otherwise the strings will be displayed untranslated.


### Translate plurals

You can easily translate a plural strings by appending intlPlural().

```dart
Text(
    'You have pushed the button {value} times.'.intlPlural(
        value: _counter,
        zero: 'You have not pushed the button yet.',
        one: 'You pushed the button once',
    ),
),
```

If the plural string contains parameters they can be passed to `intlPlural()` as `Map<String, String>`.

```dart
Text(
    'You have pushed the button {value} times.'.intlPlural(
        value: _counter,
        zero: 'You have not pushed the button yet.',
        one: 'You pushed the button {where} once',
        params: {"where": "in the office"}
    ),
),
```

> If the plural string is not yet included in the translations, it will be returned or displayed untranslated

When you have marked new plural strings for translation, you need to run the above command to extract and generate the translation files. After that you need to restart the app. Otherwise the string will be displayed untranslated.


### Translate selects

You can easily translate a select strings by appending intlSelect().
The main string will be used as `other` if none of the variants fit.

```dart
Text(
    'Someone comes'.intlSelect(value: 'female', variants: {
        "male": "A man comes",
        "female": "A woman comes"
    }),
),
```

If the select string contains parameters they can be passed to `intlSelect()` as `Map<String, String>`.

```dart
Text(
    'Someone comes'.intlSelect(
        value: 'male',
        variants: {
            "male": "A {age} year old man comes",
            "female": "A {age} year old woman comes"
        },
        params: {"age": "30"},
    ),
),

```

> If the select string is not yet included in the translations, it will be returned or displayed untranslated

When you have marked new select strings for translation, you need to run the above command to extract and generate the translation files. After that you need to restart the app. Otherwise the string will be displayed untranslated.











## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
