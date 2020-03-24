//
//  Presentive.swift
//  EasyLib
//
//  Created by zuber on 2020/3/23.
//

import Foundation

extension UIColor {
  static let cb2b2b2 = UIColor.init(rgb: 0xB2B2B2)
  static let c333333 = UIColor.init(rgb: 0x333333)
}


public class Presentive {
  
  private var title: String = ""
  private var items: [PresentiveType] = []
  private var click:((_ item: Int)->())?
  lazy var slideInTransitionDelegate = SlideInPresentationManager()
  
  public init(){}
  
  public func presentTitle(_ title: String) -> Self{
    self.title = title
    return self
  }
  public func presentItems(_ items: [PresentiveType]) -> Self{
    self.items = items
    return self
  }
  public func action(_ click:((_ item: Int)->())?) -> Self{
    self.click = click
    return self
  }
  
  public func present(_ controller: UIViewController){
    slideInTransitionDelegate.isMoveTogher = false
    slideInTransitionDelegate.direction = .bottom
    let vc = PresentiveController(title: self.title , items: self.items )
    vc.clickItems = click
    vc.transitioningDelegate = slideInTransitionDelegate
    vc.modalPresentationStyle = .custom
    controller.present(vc, animated: true, completion: nil)
  }
  
}
