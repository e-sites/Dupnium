# Dupnium

![Dupnium](Assets/logo.png)

Dupnium is part of the **[E-sites iOS Suite](https://github.com/e-sites/iOS-Suite)**.

---

A small helper class for localization

[![forthebadge](http://forthebadge.com/images/badges/made-with-swift.svg)](http://forthebadge.com) [![forthebadge](http://forthebadge.com/images/badges/built-with-swag.svg)](http://forthebadge.com)

[![Platform](https://img.shields.io/cocoapods/p/Dupnium.svg?style=flat)](http://cocoadocs.org/docsets/Dupnium)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Dupnium.svg)](http://cocoadocs.org/docsets/Dupnium)
[![Travis-ci](https://travis-ci.org/e-sites/Dupnium?branch=master&001)](https://travis-ci.org/e-sites/Dupnium)


# Installation

Podfile:

```ruby
pod 'Dupnium'
```

And then

```
pod install
```

# Implementation

## Example Localizable.strings

```
"welcome_text_string" = "Welcome user!";
"apples##{other}" = "%zd apples";
"apples##{one}" = "%zd apple";
```

## Swift

```swift
import Dupnium

typealias Dup = Dupnium.shared

// Sets the fallback language to dutch, if your current locale isn't available
Dup.fallbackLocale = Locale.dutch() 

Dup["welcome_text_string"] // -> Welcome user!

Dup["apples", 2] // -> 2 apples
Dup["apples", 1] // -> 1 apple
```

# UI

> `LocalizableButton` and `LocalizableLabel` are available that will automatically set translations if you provide the translated key as text in your storyboard or xib

```ruby
pod 'Dupnium/UI'
```