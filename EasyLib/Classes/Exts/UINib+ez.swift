//
//  UINib+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public extension UINib {
  
  convenience init(nibName: String){
    self.init(nibName: nibName, bundle: Bundle.main)
  }
  
}
