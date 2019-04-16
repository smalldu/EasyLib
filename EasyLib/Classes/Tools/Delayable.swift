//
//  Delayable.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public protocol Delayable {
  typealias Task = (_ cancel : Bool) -> ()
}

public extension Delayable{
  @discardableResult
  func delay(_ time:TimeInterval, task:@escaping ()->()) ->  Task? {
    
    func dispatch_later(_ block: (()->())?) {
      DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: block!)
    }
    var result: Task?
    let delayedClosure: Task = {
      cancel in
      if (cancel == false) {
        DispatchQueue.main.async(execute: task)
      }
      result = nil
    }
    result = delayedClosure
    dispatch_later {
      if let delayedClosure = result {
        delayedClosure(false)
      }
    }
    return result
  }
  
  func cancel(_ task:Task?) {
    task?(true)
  }
}


