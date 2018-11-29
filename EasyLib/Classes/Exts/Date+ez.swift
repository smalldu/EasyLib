//
//  Date+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit


public extension Date{
  
  
  /**
   格式化日期 默认  "yyyy-MM-dd"
   也可以自己提供
   
   - parameter str: 格式
   
   - returns: 格式化后日期的string类型
   */
  public func format(_ format: String? = nil) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format ?? "yyyy-MM-dd"
    return dateFormatter.string(from: self)
  }
  
  /**
   n 天以后
   
   - parameter n: 天数
   
   - returns: date
   */
  public func nDayslater(_ n: Int)-> Date{
    return  Date(timeInterval:Double(60*60*24*n), since: self)
  }
  
  
  /// n个月以后
  ///
  /// - Parameter n: n
  /// - Returns: date
  public func nMonthLater(_ n:Int)->Date? {
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    var adcomps = DateComponents()
    adcomps.month = n
    adcomps.day = -1
    return calendar?.date(byAdding: adcomps, to: self , options: NSCalendar.Options.init(rawValue: 0))
  }
  
  
  /// 相差月数
  ///
  /// - Parameters:
  ///   - startDate: 开始日期
  ///   - endDate: 结束日期
  /// - Returns: 差
  public func monthDistance(_ endDate: Date)-> Int?{
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    let compsMonth = calendar?.components(NSCalendar.Unit.month , from: self, to: endDate , options: NSCalendar.Options.init(rawValue: 0))
    return compsMonth?.month
  }
}


