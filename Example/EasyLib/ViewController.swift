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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.isUserInteractionEnabled = true
    
    view.ez.taped { (gesture) in
      print("点击")
    }
    
    view.ez.configTap { (gesuter) in
      gesuter.numberOfTapsRequired = 2
    }.event { (gesture) in
      
    }
    
    view.ez.paned { (panGesture) in
      
    }
    
    view.ez.configPan { (panGesutre) in
      panGesutre.maximumNumberOfTouches = 2
      panGesutre.minimumNumberOfTouches = 1
    }.event { (panGesutre) in
      switch panGesutre.state {
      case .began:
        print("begin")
      default:
        print("others")
      }
    }
    
    view.ez.configLongPress { (longPressGesture) in
      
    }.event { (gesture) in
      
    }
    
    view.ez.longPressed { (gesture) in
      
    }
    
    view.ez.swiped { (gesture) in
      
    }
    
  }
}


