# EasyLib

[![CI Status](https://img.shields.io/travis/smalldu/EasyLib.svg?style=flat)](https://travis-ci.org/smalldu/EasyLib)
[![Version](https://img.shields.io/cocoapods/v/EasyLib.svg?style=flat)](https://cocoapods.org/pods/EasyLib)
[![License](https://img.shields.io/cocoapods/l/EasyLib.svg?style=flat)](https://cocoapods.org/pods/EasyLib)
[![Platform](https://img.shields.io/cocoapods/p/EasyLib.svg?style=flat)](https://cocoapods.org/pods/EasyLib)

## Example

日常总结了些便利的方法，为了方便在切换项目的时候依然使用到他们。所以写了这个`EasyLib`。 

### 更方便的方式使用 `Gesture`

```swift
view.ez.taped { (gesture) in
  print("点击")
}
```

如果需要配置下： 

```swift
view.ez.configTap { (gesuter) in
  gesuter.numberOfTapsRequired = 2
}.event { (gesture) in

}
```

还支持一些其他类型的手势 

```swift
view.ez.paned { (panGesture) in

}

view.ez.configPan { (panGesutre) in

}.event { (panGesutre) in

}
```
`longPress` 、`swip` 的用法类似 



### 其他工具类 

`App.appName` 、`App.appBuild` 、 `App.appVersion` 、 `App.IDFA` 可以方便的获取到`App`的一些信息 



## Requirements

## Installation

EasyLib is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyLib'
```

## Author

smalldu, 363958265@qq.com

## License

EasyLib is available under the MIT license. See the LICENSE file for more info.
