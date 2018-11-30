//
//  StyleProtocol.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/30.
//

import UIKit


public typealias AttributedString = NSMutableAttributedString

public protocol StyleProtocol: class {
  
  var attributes: [NSAttributedString.Key : Any] { get }
  
  func set(to source: String, range: NSRange?) -> AttributedString
  
  func add(to source: AttributedString, range: NSRange?) -> AttributedString
  
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
  
  func add(to source: AttributedString, range: NSRange?) -> AttributedString {
    source.addAttributes(self.attributes, range: (range ?? NSMakeRange(0, source.length)))
    return source
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


