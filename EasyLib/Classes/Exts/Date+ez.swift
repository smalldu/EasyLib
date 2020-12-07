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
  func format(_ format: String? = nil) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format ?? "yyyy-MM-dd"
    return dateFormatter.string(from: self)
  }
  
  /**
   n 天以后
   
   - parameter n: 天数
   
   - returns: date
   */
  func nDayslater(_ n: Int)-> Date{
    return  Date(timeInterval:Double(60*60*24*n), since: self)
  }
  
  
 /// n个月以后
  ///
  /// - Parameter n: n
  /// - Returns: date
  func nMonthLater(_ n: Int)->Date? {
    let calendar = NSCalendar.current
    let comp = calendar.dateComponents([.day,.month,.year], from: self)
    if let month = comp.month , let year = comp.year , let day = comp.day {
      var nextMonth = 0
      var nextYear = 0
      var nextDay = 0
      let mon = (month + n) % 12
      if mon == 0 {
        nextMonth = 12
        let y = (month + n) / 12
        if y - 1 > 0 {
          nextYear = year + y - 1
        }else{
          nextYear = year
        }
      }else{
        nextMonth = mon
        let y = (month + n) / 12
        nextYear = year + y
      }
      // 如果是1号 月减1
      if day == 1 {
        if nextMonth == 1 {
          nextMonth = 12
          nextYear -= 1
        }else{
          nextMonth -= 1
        }
      }
      if let yearDate = calendar.date(bySetting: .year , value: nextYear, of: self) ,
        let monthDate = calendar.date(bySetting: .month, value: nextMonth, of: yearDate) , let day = comp.day ,
        let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: monthDate)?.count {
        if day == 1 {
          nextDay = numberOfDaysInMonth
        }else if day > numberOfDaysInMonth {
          nextDay = numberOfDaysInMonth
        }else if day <= numberOfDaysInMonth{
          nextDay = day - 1
        }
        if let date = calendar.date(bySetting: .day, value: nextDay, of: monthDate) {
          return date
        }
      }
    }
    return nil
  }
  
  
  /// 相差月数
  ///
  /// - Parameters:
  ///   - startDate: 开始日期
  ///   - endDate: 结束日期
  /// - Returns: 差
  func monthDistance(_ endDate: Date)-> Int?{
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    let compsMonth = calendar?.components(NSCalendar.Unit.month , from: self, to: endDate , options: NSCalendar.Options.init(rawValue: 0))
    return compsMonth?.month
  }
}


