# MSProgressSlider

[![CI Status](http://img.shields.io/travis/messeb/MSProgressSlider.svg?style=flat)](https://travis-ci.org/messeb/MSProgressSlider)
[![Version](https://img.shields.io/cocoapods/v/MSProgressSlider.svg?style=flat)](http://cocoapods.org/pods/MSProgressSlider)
[![License](https://img.shields.io/cocoapods/l/MSProgressSlider.svg?style=flat)](http://cocoapods.org/pods/MSProgressSlider)
[![Platform](https://img.shields.io/cocoapods/p/MSProgressSlider.svg?style=flat)](http://cocoapods.org/pods/MSProgressSlider)

The `MSProgressSlider` extends the `UISlider` with a second value, `progressValue`. This value is displayed as a line behind the value line.
It can be used to show a loading progress.

![Animated Progress](https://raw.githubusercontent.com/messeb/MSProgressSlider/master/documentation/msprogressslider_progress_animated.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

You can configure the progress over `progressValue`, like the `value`

```
let progressSlider = MSProgressSlider()
progressSlider.minimumValue = 0.0
progressSlider.maximumValue = 1.0
progressSlider.progressValue = 0.5
progressSlider.value = 0.25
```

### UI

The colors can be configured with `UIAppearance` protocol properties
* completeColor
* progressColor
* valueColor

and over the Interface Builder via IBInspectable

![Interface Builder](https://raw.githubusercontent.com/messeb/MSProgressSlider/master/documentation/msprogressslider_ibinspectable.jpg)

## Installation

MSProgressSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MSProgressSlider"
```

## Author

messeb

## License

MSProgressSlider is available under the MIT license. See the LICENSE file for more info.
