//
//  UIDevice+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public enum DeviceType {
  case iPhone5
  case iPhone6
  case iPhone6p
  case iPhoneX
  case iPhoneXS_Max
  case iPhoneXR
  case unknown
}

public extension UIDevice {
  
  static func iPhoneType() -> DeviceType{
    if UIDevice.current.userInterfaceIdiom == .phone {
      switch UIScreen.main.nativeBounds.height {
      case 1136:
        return .iPhone5
      case 1334:
        return .iPhone6
      case 2208:
        return .iPhone6p
      case 2436,2532,2340:
        return .iPhoneX
      case 2688,2778:
        return .iPhoneXS_Max
      case 1792:
        return .iPhoneXR
      default:
        return .unknown
      }
    }
    return .unknown
  }
  
  static func isiPhoneX() -> Bool{
    let type = UIDevice.iPhoneType()
    return type == .iPhoneX || type == .iPhoneXS_Max || type == .iPhoneXR
  }
  
  static func isiPhone5() -> Bool{
    return UIDevice.iPhoneType() == .iPhone5
  }
  
  static var statusbarHeight: CGFloat {
    return isiPhoneX() ? 44:20
  }
  
  static var statusbarAndNavigationbarHeight: CGFloat {
    return isiPhoneX() ? 88:64
  }
}
