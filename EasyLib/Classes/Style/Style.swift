//
//  Style.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/30.
//

import UIKit

public class Style: StyleProtocol {
  
  public var attributes: [NSAttributedString.Key : Any] {
    return innerAttributes
  }
  
  public typealias StyleInitHandler = ((Style) -> (Void))
  
  // 用来存储 attribute
  private var innerAttributes: [NSAttributedString.Key : Any] = [:]
  
  public init(_ handler: StyleInitHandler? = nil) {
    handler?(self)
  }
  
  public var color: UIColor? {
    set { self.set(attribute: newValue, forKey: .foregroundColor) }
    get { return self.get(attributeForKey: .foregroundColor) }
  }
  
  public var font: UIFont? {
    set { self.set(attribute: newValue, forKey: .font) }
    get { return self.get(attributeForKey: .font) }
  }
  
  public var backColor: UIColor? {
    set { self.set(attribute: newValue, forKey: .backgroundColor) }
    get { return self.get(attributeForKey: .backgroundColor) }
  }
  
  public var underline: NSUnderlineStyle? {
    set {
      self.set(attribute: newValue?.rawValue, forKey: .underlineStyle)
      self.set(attribute: newValue, forKey: .underlineColor)
    }
    get {
      let style: Int? = self.get(attributeForKey: .underlineStyle)
      return NSUnderlineStyle(rawValue: style ?? 0)
    }
  }
  
  public var underlineColor: UIColor? {
    set {
      self.set(attribute: newValue, forKey: .underlineColor)
    }
    get {
      return self.get(attributeForKey: .underlineColor)
    }
  }
  
  public var strokeColor: UIColor? {
    set {
      self.set(attribute: newValue, forKey: .strokeColor)
    }
    get {
      return self.get(attributeForKey: .strokeColor)
    }
  }
  
  public var strokeWidth: CGFloat? {
    set {
      self.set(attribute: newValue, forKey: .strokeWidth)
    }
    get {
      return self.get(attributeForKey: .strokeWidth)
    }
  }
  
  public var strike: Int? {
    set {
      self.set(attribute: newValue, forKey: .strikethroughStyle)
    }
    get {
      return self.get(attributeForKey: .strikethroughStyle)
    }
  }
  
  public var strikeColor: UIColor? {
    set {
      self.set(attribute: newValue, forKey: .strikethroughColor)
    }
    get {
      return self.get(attributeForKey: .strikethroughColor)
    }
  }
  
  public var paragraph: NSMutableParagraphStyle {
    set {
      self.set(attribute: newValue, forKey: .paragraphStyle)
    }
    get {
      if let paragraph: NSMutableParagraphStyle = self.get(attributeForKey: .paragraphStyle) {
        return paragraph
      }
      let paragraph = NSMutableParagraphStyle()
      self.set(attribute: paragraph, forKey: .paragraphStyle)
      return paragraph
    }
  }
  
  public var lineSpacing: CGFloat {
    set { self.paragraph.lineSpacing = newValue }
    get { return self.paragraph.lineSpacing }
  }
  
  public var paragraphSpacingBefore: CGFloat {
    set { self.paragraph.paragraphSpacingBefore = newValue }
    get { return self.paragraph.paragraphSpacingBefore }
  }
  
  public var paragraphSpacingAfter: CGFloat {
    set { self.paragraph.paragraphSpacing = newValue }
    get { return self.paragraph.paragraphSpacing }
  }
  
  public var alignment: NSTextAlignment {
    set { self.paragraph.alignment = newValue }
    get { return self.paragraph.alignment }
  }
  
  public var firstLineHeadIndent: CGFloat {
    set { self.paragraph.firstLineHeadIndent = newValue }
    get { return self.paragraph.firstLineHeadIndent }
  }
  
  public var headIndent: CGFloat {
    set { self.paragraph.headIndent = newValue }
    get { return self.paragraph.headIndent }
  }
  
  public var tailIndent: CGFloat {
    set { self.paragraph.tailIndent = newValue }
    get { return self.paragraph.tailIndent }
  }
  
  public var lineBreakMode: NSLineBreakMode {
    set { self.paragraph.lineBreakMode = newValue }
    get { return self.paragraph.lineBreakMode }
  }
  
  public var minimumLineHeight: CGFloat {
    set { self.paragraph.minimumLineHeight = newValue }
    get { return self.paragraph.minimumLineHeight }
  }
  
  public var maximumLineHeight: CGFloat {
    set { self.paragraph.maximumLineHeight = newValue }
    get { return self.paragraph.maximumLineHeight }
  }
  
  public var baseWritingDirection: NSWritingDirection {
    set { self.paragraph.baseWritingDirection = newValue }
    get { return self.paragraph.baseWritingDirection }
  }
  
  public var lineHeightMultiple: CGFloat {
    set { self.paragraph.lineHeightMultiple = newValue }
    get { return self.paragraph.lineHeightMultiple }
  }
  
  public var hyphenationFactor: Float {
    set { self.paragraph.hyphenationFactor = newValue }
    get { return self.paragraph.hyphenationFactor }
  }
  
  public var shadow: NSShadow? {
    set {
      self.set(attribute: newValue, forKey: .shadow)
    }
    get {
      return self.get(attributeForKey: .shadow)
    }
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

