## 0.0.4

**Breaking Change**
Code generation has been outsourced. Therefore add intl_extension_builder as dev dependency

```console
$ flutter pub add --dev intl_extension_builder
```

The new command to extract the string and create translation files is as follows:

```console
$ flutter pub run intl_extension_builder:build
```



* Fixed error when extracting intlSelect with comma at the end
* Freezed removed as a dependency because it is no longer needed

## 0.0.3

* Metadata adjusted 

## 0.0.2

* Adjustments on the example

## 0.0.1

* initial release.
