//
//  String+version.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public extension String {
  
  public static func ==(lhs: String, rhs: String) -> Bool {
    return lhs.compare(rhs, options: .numeric) == .orderedSame
  }
  
  public static func <(lhs: String, rhs: String) -> Bool {
    return lhs.compare(rhs, options: .numeric) == .orderedAscending
  }
  
  public static func <=(lhs: String, rhs: String) -> Bool {
    return lhs.compare(rhs, options: .numeric) == .orderedAscending || lhs.compare(rhs, options: .numeric) == .orderedSame
  }
  
  public static func >(lhs: String, rhs: String) -> Bool {
    return lhs.compare(rhs, options: .numeric) == .orderedDescending
  }
  
  public static func >=(lhs: String, rhs: String) -> Bool {
    return lhs.compare(rhs, options: .numeric) == .orderedDescending || lhs.compare(rhs, options: .numeric) == .orderedSame
  }
  
}
