# SASLoaderPod

[![CI Status](https://img.shields.io/travis/AnupSukumaran/SASLoaderPod.svg?style=flat)](https://travis-ci.org/AnupSukumaran/SASLoaderPod)
[![Version](https://img.shields.io/cocoapods/v/SASLoaderPod.svg?style=flat)](https://cocoapods.org/pods/SASLoaderPod)
[![License](https://img.shields.io/cocoapods/l/SASLoaderPod.svg?style=flat)](https://cocoapods.org/pods/SASLoaderPod)
[![Platform](https://img.shields.io/cocoapods/p/SASLoaderPod.svg?style=flat)](https://cocoapods.org/pods/SASLoaderPod)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SASLoaderPod is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SASLoaderPod'
```

## Steps on how to use this pod.

1) Import SASLoaderPod in the view controller class
2) Create a variable for the loader like this -> 
```
    var loaderView:LoaderView!
```
3) In the ViewDidLoad() function initialize the LoaderView class and also change the type, color and padding

```
    loaderView = LoaderView(callOn: self)
```

3) Then you can start the animation as show ->  
```
    loaderView.startAnimating()
```

4) To stop the loader call this ->

```
    loaderView.stopAnimating()
```

 at any event


## Author

AnupSukumaran, anup.sukumaran9@gmail.com

## License

SASLoaderPod is available under the MIT license. See the LICENSE file for more info.
