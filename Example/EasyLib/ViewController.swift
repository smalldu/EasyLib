//
//  ViewController.swift
//  EasyLib
//
//  Created by smalldu on 11/29/2018.
//  Copyright (c) 2018 smalldu. All rights reserved.
//

import UIKit
import EasyLib


struct Styles {
  static let H1 = Style {
    $0.color = UIColor(hex: 0x333333)
    $0.font = .mediumOf(30)
  }
  
  static let H2 = Style {
    $0.color = UIColor(hex: 0x333333)
    $0.font = .mediumOf(26)
  }
}


class ViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.isUserInteractionEnabled = true
   
    let style = Style {
      $0.color = .white
      $0.font = UIFont.lightOf(12)
      $0.backColor = .black
      $0.underline = .styleSingle
      $0.underlineColor = .red
    }
    
    let attribute = " Hello World It is a good world . ".set(style)
    
    
    let style1 = Style {
      $0.color = UIColor(hex: 0x666666)
      $0.strokeWidth = 2
      $0.strokeColor = .blue
      $0.strike = 1
      $0.strikeColor = .black
      $0.font = .mediumOf(25)
    }
    
    label.attributedText = " iPhone X ".set(style1) + attribute + "列表推导是构建列表（list）的快捷方式，生成器表达式则可以用来创建其他任何类型的序列.".set(Style({
      $0.font = UIFont.semiboldOf(15)
      $0.color = UIColor(hex: 0x666666)
    }))
    +
    """
     \n
    　       滚滚长江东逝水，浪花淘尽英雄。
    　　　 是非成败转头空，
    　　　 青山依旧在，几度夕阳红。
    　　　 白发渔樵江渚上，惯看秋月春风。
    　　　 一壶浊酒喜相逢，
    　　　 古今多少事，都付笑谈中。
    """.set(Style({
          $0.font = .mediumOf(18)
          $0.color = UIColor(hex: 0x333333)
          $0.lineSpacing = 15
        }))
    
//    label.ez.style = Styles.H1
//    label.ez.text = "滚滚长江东逝水，浪花淘尽英雄。"
  
  }
  
}
