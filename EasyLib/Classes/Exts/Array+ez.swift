//
//  Array+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public extension Array {
  
  public func safeIndex(_ i : Int) -> Element? {
    if i < self.count && i >= 0 {
      return self[i]
    } else {
      return nil
    }
  }
  
  public subscript(input:[Int])->ArraySlice<Element>{
    get{
      var result = ArraySlice<Element>()
      for i in input{
        assert(i<self.count,"数组越界")
        result.append(self[i])
      }
      return result
    }
    
    set{
      for (index,i) in input.enumerated(){
        assert(i<self.count,"数组越界")
        self[i] = newValue[index]
      }
    }
  }
  
  public subscript(first: Int, second: Int, other: Int...) -> ArraySlice<Element> {
    get{
      var result = ArraySlice<Element>()
      var tmp = other
      tmp.insert(second, at: 0)
      tmp.insert(first, at: 0)
      for i in tmp{
        assert(i<self.count,"数组越界")
        result.append(self[i])
      }
      return result
    }
    
    set{
      var tmp = other
      tmp.insert(second, at: 0)
      tmp.insert(first, at: 0)
      for (index,i) in tmp.enumerated(){
        assert(i<self.count,"数组越界")
        self[i] = newValue[index]
      }
    }
  }
  
  public mutating func appendItems(_ items:[Element]){
    items.forEach { (t) in
      self.append(t)
    }
  }
  
}


