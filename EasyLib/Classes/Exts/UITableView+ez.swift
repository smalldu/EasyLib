//
//  UITableView+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public protocol ReusableView: class {}

public extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String{
    return String(describing: self)
  }
  
}

extension UITableViewCell: ReusableView { }

public protocol NibLoadableView: class { }

public extension NibLoadableView where Self: UIView{
  
  static var NibName: String {
    return String(describing: self)
  }
  
}

extension UITableViewCell: NibLoadableView{ }

public extension UITableView {
  
  func easyRegisterNib<T:UITableViewCell>(_:T.Type) {
    let Nib = UINib.init(nibName: T.NibName, bundle: nil)
    register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func easyRegisterClass<T:UITableViewCell>(_:T.Type) {
    register(T.self , forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func easyDequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell withidentifier : \(T.reuseIdentifier)")
    }
    return cell
  }
  
}

