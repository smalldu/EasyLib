//
//  UIFont+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit


public extension UIFont {
  
  static func lightOf(_ size:CGFloat) -> UIFont {
    if let font = UIFont(name: "PingFangSC-Light" , size: size){
      return font
    }else{
      return UIFont.systemFont(ofSize: size)
    }
  }
  
  static func regularOf(_ size:CGFloat) -> UIFont {
    if let font = UIFont(name: "PingFangSC-Regular" , size: size){
      return font
    }else{
      return UIFont.systemFont(ofSize:size)
    }
  }
  
  static func mediumOf(_ size:CGFloat)  -> UIFont {
    if let font = UIFont(name: "PingFangSC-Medium" , size: size){
      return font
    }else{
      return UIFont.boldSystemFont(ofSize: size)
    }
  }
  
  static func semiboldOf(_ size:CGFloat)  -> UIFont {
    if let font = UIFont(name: "PingFangSC-Semibold" , size: size){
      return font
    }else{
      return UIFont.boldSystemFont(ofSize: size)
    }
  }
  
}
