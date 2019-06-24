//
//  UIFont+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit


public extension UIFont {
  
  static func translateSize(_ size: CGFloat) -> CGFloat {
    var newSize = size
    if UIDevice.isiPhone5() {
      newSize = size - 1
    }
    return newSize
  }
  
  static func lightOf(_ size: CGFloat) -> UIFont {
    if let font = UIFont(name: "PingFangSC-Light" , size: translateSize(size)){
      return font
    }else{
      return UIFont.systemFont(ofSize: translateSize(size))
    }
  }
  
  static func regularOf(_ size: CGFloat) -> UIFont {
    if let font = UIFont(name: "PingFangSC-Regular" , size: translateSize(size)){
      return font
    }else{
      return UIFont.systemFont(ofSize:translateSize(size))
    }
  }
  
  static func mediumOf(_ size: CGFloat)  -> UIFont {
    if let font = UIFont(name: "PingFangSC-Medium" , size: translateSize(size)){
      return font
    }else{
      return UIFont.boldSystemFont(ofSize: translateSize(size))
    }
  }
  
  static func semiboldOf(_ size: CGFloat)  -> UIFont {
    if let font = UIFont(name: "PingFangSC-Semibold" , size: translateSize(size)){
      return font
    }else{
      return UIFont.boldSystemFont(ofSize: translateSize(size))
    }
  }
  
}
