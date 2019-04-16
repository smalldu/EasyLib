//
//  UIViewCompatible.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public protocol EazyCompatible {
  associatedtype CompatableType
  var ez: CompatableType { get }
}


public extension EazyCompatible {
  var ez: Auto<Self> {
    get { return Auto(self) }
    set { }
  }
}

public class Auto<Base> {
  public let base: Base
  public init(_ base: Base) {
    self.base = base
  }
}
