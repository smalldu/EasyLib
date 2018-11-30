//
//  ViewController.swift
//  EasyLib
//
//  Created by smalldu on 11/29/2018.
//  Copyright (c) 2018 smalldu. All rights reserved.
//

import UIKit
import EasyLib

class ViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.isUserInteractionEnabled = true
   
    let style = Style {
      $0.color = .white
      $0.font = UIFont.lightOf(12)
      $0.backColor = .black
    }
    let attribute = "Hello World It is a good world . ".set(style)
    
    label.attributedText = "xxx" + attribute + "列表推导是构建列表（list）的快捷方式，生成器表达式则可以用来创建其他任何类型的序列.".set(Style({
      $0.font = UIFont.semiboldOf(15)
      $0.color = UIColor(hex: 0x666666)
    }))
    
    
  }
}
