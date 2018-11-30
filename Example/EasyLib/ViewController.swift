//
//  ViewController.swift
//  EasyLib
//
//  Created by smalldu on 11/29/2018.
//  Copyright (c) 2018 smalldu. All rights reserved.
//

import UIKit
import EasyLib



struct Style {
  
  enum `Type` {
    case string
    case label
    case button
  }
  
  let type: Type
  let textColor: UIColor
  let font: UIFont
  
  init(_ textColor: UIColor, font: UIFont,type: Type = .string) {
    self.type = type
    self.textColor = textColor
    self.font = font
    
  }
  
}



struct Styles {
  static let title = Style(UIColor(rgb: 0x333333), font: .mediumOf(15), type: .label)
  
}

extension UILabel {
  
  func set(style: Style) {
    self.textColor = style.textColor
    
  }
  
  
}












class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.isUserInteractionEnabled = true
    
    
    
  }
}



//view.ez.taped { (gesture) in
//  print("点击")
//}
//
//view.ez.configTap { (gesuter) in
//  gesuter.numberOfTapsRequired = 2
//  }.event { (gesture) in
//
//}
//
//view.ez.paned { (panGesture) in
//
//}
//
//view.ez.configPan { (panGesutre) in
//  panGesutre.maximumNumberOfTouches = 2
//  panGesutre.minimumNumberOfTouches = 1
//  }.event { (panGesutre) in
//    switch panGesutre.state {
//    case .began:
//      print("begin")
//    default:
//      print("others")
//    }
//}
//
//view.ez.configLongPress { (longPressGesture) in
//
//  }.event { (gesture) in
//
//}
//
//view.ez.longPressed { (gesture) in
//
//}
//
//view.ez.swiped { (gesture) in
//
//}
