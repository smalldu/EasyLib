//
//  UIImage+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit

extension UIImage : EazyCompatible{
}

public extension Auto where Base: UIImage {
  
  public func original() -> UIImage {
    return self.base.withRenderingMode(.alwaysOriginal)
  }
  
  public func template() -> UIImage {
    return self.base.withRenderingMode(.alwaysTemplate)
  }
  
  //图像比例缩放
  public func scaleImage(_ img: UIImage,scaleSize: CGFloat)->UIImage{
    UIGraphicsBeginImageContext(CGSize(width: img.size.width * scaleSize, height: img.size.height * scaleSize))
    img.draw(in: CGRect(x: 0, y: 0, width: CGFloat( Int(img.size.width * scaleSize) + 1 ) , height: img.size.height * scaleSize + 1))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return scaledImage!
  }
  
  //自定长宽 相当于裁剪分辨率
  public func reSizeImage(_ toSize: CGSize)->UIImage{
    UIGraphicsBeginImageContext(toSize)
    self.base.draw(in: CGRect(x: 0, y: 0, width: toSize.width, height: toSize.height))
    let reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage!;
  }
  
  /// 等比例裁剪分辨率
  ///
  /// - Parameter width: 指定最大宽度
  /// - Returns: UIImage
  public func resizeWidthTo(_ width: CGFloat) -> UIImage {
    if width >= base.size.width {
      return self.base
    }
    let heght = base.size.height * (width/base.size.width)
    let newSize = CGSize(width: width, height: heght)
    return reSizeImage(newSize)
  }
  
}
