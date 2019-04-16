//
//  Data+ez.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import UIKit


public extension Data{
  
  // 无损压缩
  @available(iOS 10.0, *)
  func lossLessCompress() -> Data? {
    var data: Data?
    print("图片压缩之前大小： \(self.count/1024)")
    if let ciImage = CIImage(data: self) , let colorSpace = ciImage.colorSpace{
      let context = CIContext()
      data = context.jpegRepresentation(of: ciImage, colorSpace: colorSpace , options: [:])
    }
    print("图片压缩之后大小： \(data!.count/1024)")
    return data
  }
  
  
  func lubanCompress() -> UIImage? {
    guard let image = UIImage(data: self) else { return nil }
    //    var size: Double = 0
    print("缩放前大小\(image.size)")
    let fixelW = Int(image.size.width)
    let fixelH = Int(image.size.height)
    var thumbW = fixelW % 2  == 1 ? fixelW + 1 : fixelW
    var thumbH = fixelH % 2  == 1 ? fixelH + 1 : fixelH
    
    let scale = Double(fixelW)/Double(fixelH)
    print(scale)
    
    if scale <= 1 && scale > 0.5625 {
      if (fixelH < 1664) {
        if (self.count/1024 < 150) {
          return image
        }
        //        size = Double(fixelW * fixelH) / pow(1664, 2) * 150
        //        size = size < 60 ? 60 : size
      }else if fixelH >= 1664 && fixelH < 4990 {
        thumbW = fixelW / 2
        thumbH = fixelH / 2
        //        size   = Double(thumbH * thumbW) / pow(2495, 2) * 300;
        //        size = size < 60 ? 60 : size
      }else if fixelH >= 4990 && fixelH < 10240 {
        thumbW = fixelW / 4
        thumbH = fixelH / 4
        //        size = Double(thumbW * thumbH) / pow(2560, 2) * 300;
        //        size = size < 100 ? 100 : size
      }else {
        let multiple = fixelH / 1280 == 0 ? 1 : fixelH / 1280
        thumbW = fixelW / multiple
        thumbH = fixelH / multiple
        //        size = Double(thumbW * thumbH) / pow(2560, 2) * 300
        //        size = size < 100 ? 100 : size
      }
    }else if (scale <= 0.5625 && scale > 0.5) {
      if fixelH < 1280 && self.count/1024 < 200 {
        return image
      }
      let multiple = fixelH / 1280 == 0 ? 1 : fixelH / 1280
      thumbW = fixelW / multiple
      thumbH = fixelH / multiple
      //      size = Double(thumbW * thumbH) / (1440.0 * 2560.0) * 400
      //      size = size < 100 ? 100 : size
    } else {
      let multiple = ceil(Double(fixelH) / (1280.0 / scale))
      thumbW = fixelW / Int(multiple)
      thumbH = fixelH / Int(multiple)
      //      size = (Double(thumbW * thumbH) / (1280.0 * (1280 / scale))) * 500
      //      size = size < 100 ? 100 : size
    }
    // 缩放
    let reSize = CGSize(width: thumbW, height: thumbH)
    print("缩放后大小\(reSize)")
    return image.ez.reSizeImage(reSize)
  }
  
  /*
   图片压缩方案:
   
   */
  /// 正常的压缩
  /// - Returns: Data
  func compressNormal() -> Data {
    print("压缩前图片大小： \(self.count/1024)")
    let originalSize = self.count/1024
    // 如果小于 300 k ，不做任何操作
    if originalSize < 300 {
      // 图片太小 不做压缩
      return self
    }
    var result_data = self
    if let image = self.lubanCompress(){
      if let data = image.jpegData(compressionQuality: 0.8){
        result_data = data
      }
    }
    print("图片大小： \(result_data.count/1024)")
    return result_data
  }
  
}

