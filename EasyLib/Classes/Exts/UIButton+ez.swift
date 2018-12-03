//
//  UIButton+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

public extension Auto where Base: UIButton {
  
  public enum ButtonEdgeStyle {
    case top  // image 上 label 下
    case left // image 左 label 右
    case bottom // image 下 label 上
    case right // image 右 label 左
  }
  
  /// button 内布局样式
  ///
  /// - Parameters:
  ///   - style: 样式
  ///   - space: 间隔
  public func layoutWith( style: ButtonEdgeStyle , space: CGFloat ) {
    guard let image = self.base.imageView?.image , let _ = self.base.titleLabel else {
      return
    }
    let imageSize = image.size
    let labelWidth: CGFloat = self.base.titleLabel?.intrinsicContentSize.width ?? 0
    let labelHeight: CGFloat = self.base.titleLabel?.intrinsicContentSize.height ?? 0
    
    var imageEdgeInsets = UIEdgeInsets.zero
    var labelEdgeInsets = UIEdgeInsets.zero
    
    switch style {
    case .top:
      imageEdgeInsets = UIEdgeInsets(top: -labelHeight-space/2, left: 0, bottom: 0, right: -labelWidth)
      labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -imageSize.height-space/2, right: 0)
    case .left:
      imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2, bottom: 0, right: space/2)
      labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2, bottom:0, right: -space/2)
    case .bottom:
      imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0 , right: -labelWidth)
      labelEdgeInsets = UIEdgeInsets(top: -imageSize.height-space/2, left: -imageSize.width, bottom: 0, right: 0)
    case .right:
      imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2, bottom: 0, right: -labelWidth-space/2)
      labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width-space/2, bottom:0, right: imageSize.width+space/2)
    }
    self.base.titleEdgeInsets = labelEdgeInsets
    self.base.imageEdgeInsets = imageEdgeInsets
  }
  
  public var normalTitle: String?{
    set{
      self.base.setTitle(newValue,for: .normal)
    }
    get{
      return self.base.titleLabel?.text
    }
  }
  
  public var normalImage: UIImage?{
    set{
      self.base.setImage(newValue, for: .normal)
    }
    get{
      return self.base.imageView?.image
    }
  }
  
  public var normalColor: UIColor?{
    set{
      self.base.setTitleColor(newValue, for: .normal )
    }
    get{
      return self.base.titleLabel?.textColor
    }
  }
  
  public var font: UIFont? {
    set{
      self.base.titleLabel?.font = newValue
    }
    get{
      return self.base.titleLabel?.font
    }
  }
  
  public func regular(size: CGFloat,color: UIColor?){
    self.base.setTitleColor(color, for: .normal)
    self.base.titleLabel?.font = UIFont.regularOf(size)
  }

  public func medium(size: CGFloat,color: UIColor?){
    self.base.setTitleColor(color, for: .normal)
    self.base.titleLabel?.font = UIFont.mediumOf(size)
  }

  public func light(size: CGFloat,color: UIColor?){
    self.base.setTitleColor(color, for: .normal)
    self.base.titleLabel?.font = UIFont.lightOf(size)
  }

  public func semibold(size: CGFloat,color: UIColor?){
    self.base.setTitleColor(color, for: .normal)
    self.base.titleLabel?.font = UIFont.semiboldOf(size)
  }
  
}
