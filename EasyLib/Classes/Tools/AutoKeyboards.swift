//
//  AutoKeyboards.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//
import UIKit

public protocol AutoKeyboards {
}

extension AutoKeyboards where Self: UIViewController {
  
  // 返回外部处理
  public var backTap: UITapGestureRecognizer? {
    return AutoKey.shared.tap
  }
  
  // 注册通知
  public func registNotify(){
    AutoKey.shared.view = self.view
    AutoKey.shared.registNotify()
  }
  
  // 注销通知
  public func resignNotify(){
    AutoKey.shared.resignNotify()
  }
  
  // 注册tap
  public func registTap(){
    AutoKey.shared.registTap()
  }
}

class AutoKey: NSObject {
  
  public var view: UIView!
  public var tap: UITapGestureRecognizer?
  
  public static var shared: AutoKey = AutoKey()
  
  public func registNotify(){
    NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShowBase(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHideBase(_:)), name: UIResponder.keyboardWillHideNotification , object: nil)
  }
  
  public func registTap(){
    tap = UITapGestureRecognizer(target: self, action:#selector(handleTouches(_:)))
    tap?.delegate = self
    self.view.addGestureRecognizer(tap!)
  }
  
  @objc public func handleTouches(_ sender:UITapGestureRecognizer){
    if sender.location(in: self.view).y < self.view.bounds.height{
      UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
  }
  
  func resignNotify(){
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc public func keyBoardWillShowBase(_ note:Notification){
    guard let userInfo  = note.userInfo else { return }
    guard let window = UIApplication.shared.keyWindow else { return }
    let keyBoardBounds = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
    let deltaY = keyBoardBounds.size.height
    
    let currV = window.ez.findFirstResponder()
    
    if let currV = currV {
      var p = self.view.convert(currV.frame.origin, from: currV.superview)
      if p.y > 0{
        p.y = -1*p.y
      }
      let animations:(() -> Void) = {
        self.view.transform = CGAffineTransform(translationX: 0,y: min((-deltaY+(self.view.frame.height + p.y - currV.frame.height - 20)),0))
      }
      if duration > 0 {
        let options = UIView.AnimationOptions(rawValue: UInt((userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
        UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
      }else{
        animations()
      }
    }
  }
  
  @objc public func keyBoardWillHideBase(_ note: Notification){
    let userInfo  = note.userInfo
    let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
    let animations:(() -> Void) = {
      self.view.transform = CGAffineTransform.identity
    }
    if duration > 0 {
      let options = UIView.AnimationOptions(rawValue: UInt((userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
      UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
    }else{
      animations()
    }
  }
}

extension AutoKey: UIGestureRecognizerDelegate{
  
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    if  NSStringFromClass(touch.view!.classForCoder) == "UITableViewCellContentView"{
      // 去掉跟tableviewcell的冲突
      return false
    }
    return true
  }
  
}
