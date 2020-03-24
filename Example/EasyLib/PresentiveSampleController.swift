//
//  PresentiveSampleController.swift
//  EasyLib_Example
//
//  Created by zuber on 2020/3/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import EasyLib

class PresentiveSampleController: UIViewController {

  @IBOutlet weak var normalBtn: UIButton!
  @IBOutlet weak var imageTextBtn: UIButton!
  @IBOutlet weak var titleBtn: UIButton!
  @IBOutlet weak var attributeBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    normalBtn.ez.regular(size: 15, color: .white)
    imageTextBtn.ez.regular(size: 15, color: .white)
    titleBtn.ez.regular(size: 15, color: .white)
    attributeBtn.ez.regular(size: 15, color: .white)
    normalBtn.addTarget(self, action: #selector(normalClicked), for: .touchUpInside)
    imageTextBtn.addTarget(self, action: #selector(imageTextClicked), for: .touchUpInside)
    titleBtn.addTarget(self, action: #selector(titleClicked), for: .touchUpInside)
    attributeBtn.addTarget(self, action: #selector(attributeClicked), for: .touchUpInside)
  }
  
  @objc
  private func normalClicked(){
    let items: [PresentiveType] = [.text("测试1"),.text("测试2")]
    Presentive()
      .presentItems(items)
      .action { (index) in
        print("你点击了\(items[index].value)")
      }.present(self)
    
  }
  @objc
  private func imageTextClicked(){
    
  }
  @objc
  private func titleClicked(){
    
  }
  @objc
  private func attributeClicked(){
    
  }
  
  

}
