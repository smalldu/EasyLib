//
//  ViewController.swift
//  EasyLib
//
//  Created by smalldu on 11/29/2018.
//  Copyright (c) 2018 smalldu. All rights reserved.
//

import UIKit
import EasyLib


public typealias AttributedString = NSMutableAttributedString

public protocol StyleProtocol: class {
  
  var attributes: [NSAttributedString.Key : Any] { get }
  
  func set(to source: String, range: NSRange?) -> AttributedString
  
  @discardableResult
  func set(to source: AttributedString, range: NSRange?) -> AttributedString
  
  @discardableResult
  func remove(from source: AttributedString, range: NSRange?) -> AttributedString
}


public extension StyleProtocol {
  
  func set(to source: String, range: NSRange?) -> AttributedString {
    let attributedText = AttributedString(string: source)
    attributedText.addAttributes(self.attributes, range: (range ?? NSMakeRange(0, attributedText.length)))
    return attributedText
  }
  
  @discardableResult
  func set(to source: AttributedString, range: NSRange?) -> AttributedString {
    source.addAttributes(self.attributes, range: (range ?? NSMakeRange(0, source.length)))
    return source
  }
  
  @discardableResult
  func remove(from source: AttributedString, range: NSRange?) -> AttributedString {
    self.attributes.keys.forEach({
      source.removeAttribute($0, range: (range ?? NSMakeRange(0, source.length)))
    })
    return source
  }
  
}



class Style: StyleProtocol {
  
  var attributes: [NSAttributedString.Key : Any] {
    return innerAttributes
  }
  
  
  public typealias StyleInitHandler = ((Style) -> (Void))
  
  // 用来存储 attribute
  private var innerAttributes: [NSAttributedString.Key : Any] = [:]
  
  init(_ handler: StyleInitHandler? = nil) {
    handler?(self)
  }
  
  var color: UIColor? {
    set { self.set(attribute: newValue, forKey: .foregroundColor) }
    get { return self.get(attributeForKey: .foregroundColor) }
  }
  
  var font: UIFont? {
    set { self.set(attribute: newValue, forKey: .font) }
    get { return self.get(attributeForKey: .font) }
  }
  
  
  
  // 设置 attribute
  public func set<T>(attribute value: T?, forKey key: NSAttributedString.Key) {
    guard let value = value else {
      self.innerAttributes.removeValue(forKey: key)
      return
    }
    self.innerAttributes[key] = value
  }
  
  public func get<T>(attributeForKey key: NSAttributedString.Key) -> T? {
    return (self.innerAttributes[key] as? T)
  }
  
}



extension UILabel {

  
  
}

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.isUserInteractionEnabled = true
    
  }
}



//view.ez.taped { (gesture) in
//  print("点击")
//}
//
//view.ez.configTap { (gesuter) in
//  gesuter.numberOfTapsRequired = 2
//  }.event { (gesture) in
//
//}
//
//view.ez.paned { (panGesture) in
//
//}
//
//view.ez.configPan { (panGesutre) in
//  panGesutre.maximumNumberOfTouches = 2
//  panGesutre.minimumNumberOfTouches = 1
//  }.event { (panGesutre) in
//    switch panGesutre.state {
//    case .began:
//      print("begin")
//    default:
//      print("others")
//    }
//}
//
//view.ez.configLongPress { (longPressGesture) in
//
//  }.event { (gesture) in
//
//}
//
//view.ez.longPressed { (gesture) in
//
//}
//
//view.ez.swiped { (gesture) in
//
//}
