//
//  UIKit+Exts.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/30.
//

import Foundation

fileprivate struct AssociatedKeys{
  static var labelStyle = "view_added_style_label"
  static var textFieldStyle = "view_added_style_textfield"
  static var textViewStyle = "view_added_style_textView"
}


// MARK: - label ez style

public extension Auto where Base: UILabel {
  
  var style: Style? {
    set { objc_setAssociatedObject(self.base,&AssociatedKeys.labelStyle, newValue , .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    get { return objc_getAssociatedObject(self.base, &AssociatedKeys.labelStyle) as? Style }
  }
  
  var text: String? {
    set {
      guard let text = newValue else {
        return
      }
      self.base.attributedText = self.style?.set(to: text, range: nil)
    }
    get { return self.base.attributedText?.string }
  }
  
}

// MARK: - textfield ez style

public extension Auto where Base: UITextField {
  
  var style: Style? {
    set { objc_setAssociatedObject(self.base,&AssociatedKeys.textFieldStyle, newValue , .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    get { return objc_getAssociatedObject(self.base, &AssociatedKeys.textFieldStyle) as? Style }
  }
  
  var text: String? {
    set {
      guard let text = newValue else {
        return
      }
      self.base.attributedText = self.style?.set(to: text, range: nil)
    }
    get { return self.base.attributedText?.string }
  }
  
}

// MARK: - textview ez style

public extension Auto where Base: UITextView {
  
  var style: Style? {
    set { objc_setAssociatedObject(self.base,&AssociatedKeys.textViewStyle, newValue , .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    get { return objc_getAssociatedObject(self.base, &AssociatedKeys.textViewStyle) as? Style }
  }
  
  var text: String? {
    set {
      guard let text = newValue else {
        return
      }
      self.base.attributedText = self.style?.set(to: text, range: nil)
    }
    get { return self.base.attributedText?.string }
  }
  
}

