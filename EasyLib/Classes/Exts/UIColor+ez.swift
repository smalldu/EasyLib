//
//  UIColor+exts.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit


public extension UIColor{
  
  public convenience init(hexString: String) {
    let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
    let scanner   = Scanner(string: hexString)
    
    if hexString.hasPrefix("#") {
      scanner.scanLocation = 1
    }
    
    var color: UInt32 = 0
    
    if scanner.scanHexInt32(&color) {
      self.init(hex: color, useAlpha: hexString.count > 7)
    } else {
      self.init(rgb: 0x000000)
    }
  }
  
  public convenience init(hex: UInt32, useAlpha alphaChannel: Bool = false) {
    let mask = UInt32(0xFF)
    
    let r = hex >> (alphaChannel ? 24 : 16) & mask
    let g = hex >> (alphaChannel ? 16 : 8) & mask
    let b = hex >> (alphaChannel ? 8 : 0) & mask
    let a = alphaChannel ? hex & mask : 255
    
    let red   = CGFloat(r) / 255
    let green = CGFloat(g) / 255
    let blue  = CGFloat(b) / 255
    let alpha = CGFloat(a) / 255
    
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  public convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  public convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
  
  
  /// To pure color image
  ///
  /// - Returns: Optinal image
  public func toImage(_ size: CGSize) -> UIImage? {
    let rect = CGRect(x: 0,y: 0,width: size.width,height: size.height)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(self.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
}

extension String {
  
  /// Transform a string to a color. String must be a valid HEX representation of the color.
  public var color: UIColor {
    return UIColor(hexString: self)
  }
  
}

