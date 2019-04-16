//
//  Delegated.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import Foundation

public class Delegated<Input,Output> {
  
  private var block: ((Input) -> Output?)?
  public func delegate<T: AnyObject>(on target: T,block: ((T,Input) -> Output)?){
    self.block = { [weak target] input in
      guard let target = target else { return nil }
      return block?(target, input)
    }
  }
  
  public func call(_ input: Input) -> Output? {
    return block?(input)
  }
}

public extension Delegated where Input == Void {
  
  func call() -> Output? {
    return call(())
  }
  
}
