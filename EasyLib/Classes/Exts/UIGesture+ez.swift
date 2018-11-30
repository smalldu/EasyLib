//
//  UIGesture+ez.swift
//  EasyLib
//
//  Created by zuber on 2018/11/30.
//

import UIKit

// MARK: - about gesture

public extension Auto where Base: UIView {
  
  public func configTap(_ block: @escaping TapGestureBlock) -> GestureAction<UITapGestureRecognizer> {
    let tap = EZTapGesture(config: block)
    self.base.addGestureRecognizer(tap)
    return tap.action
  }
  
  public func taped(_ block: @escaping TapGestureBlock) {
    let tap = EZTapGesture(block)
    self.base.addGestureRecognizer(tap)
  }
  
  public func configPan(_ block: @escaping PanGestureBlock) -> GestureAction<UIPanGestureRecognizer> {
    let pan = EZPanGesture(config: block)
    self.base.addGestureRecognizer(pan)
    return pan.action
  }
  
  public func paned(_ block: @escaping PanGestureBlock) {
    let pan = EZPanGesture(block)
    self.base.addGestureRecognizer(pan)
  }
  
  public func configLongPress(_ block: @escaping LongPressGestureBlock) -> GestureAction<UILongPressGestureRecognizer> {
    let longPress = EZLongPressGesture(config: block)
    self.base.addGestureRecognizer(longPress)
    return longPress.action
  }
  
  public func longPressed(_ block: @escaping LongPressGestureBlock) {
    let longPress = EZLongPressGesture(block)
    self.base.addGestureRecognizer(longPress)
  }
  
  
  public func configSwip(_ block: @escaping SwipGestureBlock) -> GestureAction<UISwipeGestureRecognizer> {
    let longPress = EZSwipGesture(config: block)
    self.base.addGestureRecognizer(longPress)
    return longPress.action
  }
  
  public func swiped(_ block: @escaping SwipGestureBlock) {
    let longPress = EZSwipGesture(block)
    self.base.addGestureRecognizer(longPress)
  }
  
  
}


/// tap
public typealias TapGestureBlock = (UITapGestureRecognizer) -> Void
public class EZTapGesture: UITapGestureRecognizer {
  
  public var action = GestureAction<UITapGestureRecognizer>()
  
  public init(_ block: @escaping TapGestureBlock) {
    action.block = block
    super.init(target: action, action: #selector(action.gestureAction(_:)))
  }
  
  init(config: @escaping TapGestureBlock) {
    super.init(target: action, action: #selector(action.gestureAction(_:)))
    config(self)
  }
  
}


/// pan
public typealias PanGestureBlock = (UIPanGestureRecognizer) -> Void
class EZPanGesture: UIPanGestureRecognizer {
  
  public var action = GestureAction<UIPanGestureRecognizer>()
  
  public init(_ block: @escaping PanGestureBlock) {
    action.block = block
    super.init(target: action, action: #selector(action.gestureAction(_:)))
  }
  
  init(config: @escaping PanGestureBlock) {
    super.init(target: action, action: #selector(action.gestureAction(_:)))
    config(self)
  }
}



/// long press
public typealias LongPressGestureBlock = (UILongPressGestureRecognizer) -> Void
class EZLongPressGesture: UILongPressGestureRecognizer {
  
  public var action = GestureAction<UILongPressGestureRecognizer>()
  
  public init(_ block: @escaping LongPressGestureBlock) {
    action.block = block
    super.init(target: action, action: #selector(action.gestureAction(_:)))
  }
  
  init(config: @escaping LongPressGestureBlock) {
    super.init(target: action, action: #selector(action.gestureAction(_:)))
    config(self)
  }
}


/// swip
public typealias SwipGestureBlock = (UISwipeGestureRecognizer) -> Void
class EZSwipGesture: UISwipeGestureRecognizer {
  
  public var action = GestureAction<UISwipeGestureRecognizer>()
  
  public init(_ block: @escaping SwipGestureBlock) {
    action.block = block
    super.init(target: action, action: #selector(action.gestureAction(_:)))
  }
  
  init(config: @escaping SwipGestureBlock) {
    super.init(target: action, action: #selector(action.gestureAction(_:)))
    config(self)
  }
}




public class GestureAction<T: UIGestureRecognizer> {
  
  public typealias Block = (_ gesture: T) -> Void
  public var block: Block?
  
  @objc
  func gestureAction(_ gesture: UIGestureRecognizer) {
    guard let gesture = gesture as? T else { return }
    block?(gesture)
  }
  
  public func event(_ block: Block?){
    self.block = block
  }
  
}
