# EasyLib

[![CI Status](https://img.shields.io/travis/smalldu/EasyLib.svg?style=flat)](https://travis-ci.org/smalldu/EasyLib)
[![Version](https://img.shields.io/cocoapods/v/EasyLib.svg?style=flat)](https://cocoapods.org/pods/EasyLib)
[![License](https://img.shields.io/cocoapods/l/EasyLib.svg?style=flat)](https://cocoapods.org/pods/EasyLib)
[![Platform](https://img.shields.io/cocoapods/p/EasyLib.svg?style=flat)](https://cocoapods.org/pods/EasyLib)

## 使用示例

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

### 富文本便利方法以及`UILabel` 、 `UITextField` 、 `UITextView` 样式预定义

我之前有写过一个工具 [EasyAttribute](https://github.com/smalldu/EasyAttribute) 通过链式调用的方式来使用属性字。 感觉使用起来已经很方便了。
后来我看到了 [SwiftRichString](https://github.com/malcommac/SwiftRichString) 发现他的方式更好一点，因为可以对样式先做预设，他还对字体做了很多自定义，对样式做了 `group` 等更复杂的方法。
我参照了他的方式，结合我日常工作需求写了个简单版本。



### 其他工具类 

`App.appName` 、`App.appBuild` 、 `App.appVersion` 、 `App.IDFA` 可以方便的获取到`App`的一些信息 










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
