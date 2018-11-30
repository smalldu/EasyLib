//
//  UIView+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

extension UIView : EazyCompatible{
}

public extension Auto where Base: UIView {
  
  public var height: CGFloat{
    set(v){
      self.base.frame.size.height = v
    }
    get{
      return self.base.frame.size.height
    }
  }
  
  public var width:CGFloat{
    set(v){
      self.base.frame.size.width = v
    }
    get{
      return self.base.frame.size.width
    }
  }
  
  public var size:CGSize{
    set(v){
      self.base.frame.size = v
    }
    get{
      return self.base.frame.size
    }
  }
  
  public var left:CGFloat{
    set(new){
      self.base.frame.origin.x = new
    }
    get{
      return self.base.frame.origin.x
    }
  }
  
  public var right:CGFloat{
    set(new){
      self.base.frame.origin.x = new
    }
    get{
      return  self.base.frame.origin.x + self.base.frame.size.width
    }
  }
  
  public var top:CGFloat{
    set(v){
      self.base.frame.origin.y = v
    }
    get{
      return self.base.frame.origin.y
    }
  }
  
  public var bottom:CGFloat{
    set(v){
      self.base.frame.origin.y = v - self.base.frame.size.height
    }
    get{
      return self.base.frame.origin.y + self.base.frame.size.height
    }
  }
  
  
  public var origin:CGPoint{
    set(v){
      self.base.frame.origin = v
    }
    get{
      return self.base.frame.origin
    }
  }
  
  public func withoutAnimation(_ handler:(()->())){
    CATransaction.begin()
    CATransaction.setDisableActions(true) // 关闭动画
    handler() //无动画执行
    CATransaction.commit()
  }
  
  public func findFirstResponder()->UIView?{
    if self.base.isFirstResponder{
      return self.base
    }
    for subView in self.base.subviews{
      let view = subView.ez.findFirstResponder()
      if view != nil {
        return view
      }
    }
    return nil
  }
}





