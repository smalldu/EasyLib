//
//  Extensions.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/30.
//

import UIKit

extension String {
  
  public func set(_ style: StyleProtocol, range: NSRange? = nil ) -> AttributedString {
    return style.set(to: self, range: range)
  }
  
}

extension AttributedString {
  
  @discardableResult
  public func set(style: StyleProtocol, range: NSRange? = nil) -> AttributedString {
    return style.set(to: self, range: range)
  }
  
  @discardableResult
  public func add(style: StyleProtocol, range: NSRange? = nil) -> AttributedString {
    return style.add(to: self, range: range)
  }
  
}

public func + (lhs: String, rhs: StyleProtocol) -> AttributedString {
  return rhs.set(to: lhs, range: nil)
}

public func + (lhs: AttributedString, rhs: AttributedString) -> AttributedString {
  let final = NSMutableAttributedString(attributedString: lhs)
  final.append(rhs)
  return final
}

public func + (lhs: String, rhs: AttributedString) -> AttributedString {
  let final = NSMutableAttributedString(string: lhs)
  final.append(rhs)
  return final
}

public func + (lhs: AttributedString, rhs: String) -> AttributedString {
  let final = NSMutableAttributedString(attributedString: lhs)
  final.append(NSMutableAttributedString(string: rhs))
  return final
}


extension NSNumber {
  
  internal static func from(float: Float?) -> NSNumber? {
    guard let float = float else { return nil }
    return NSNumber(value: float)
  }
  
  internal static func from(int: Int?) -> NSNumber? {
    guard let int = int else { return nil }
    return NSNumber(value: int)
  }
  
  internal static func from(underlineStyle: NSUnderlineStyle?) -> NSNumber? {
    guard let v = underlineStyle?.rawValue else { return nil }
    return NSNumber(value: v)
  }
  
  internal func toUnderlineStyle() -> NSUnderlineStyle? {
    return NSUnderlineStyle.init(rawValue: self.intValue)
  }
  
}

