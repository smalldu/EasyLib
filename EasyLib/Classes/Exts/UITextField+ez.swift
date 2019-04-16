//
//  UITextField+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public extension Auto where Base: UITextField {
  
  func regular(size: CGFloat,color: UIColor?){
    self.base.textColor = color
    self.base.font = UIFont.regularOf(size)
  }
  
  func medium(size: CGFloat,color: UIColor?){
    self.base.textColor = color
    self.base.font = UIFont.mediumOf(size)
  }
  
  func light(size: CGFloat,color: UIColor?){
    self.base.textColor = color
    self.base.font = UIFont.lightOf(size)
  }
  
  func semibold(size: CGFloat,color: UIColor?){
    self.base.textColor = color
    self.base.font = UIFont.semiboldOf(size)
  }
}
