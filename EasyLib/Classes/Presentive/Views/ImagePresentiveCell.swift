//
//  ImagePresentiveCell.swift
//  PresentUI
//
//  Created by orli on 2018/3/16.
//  Copyright © 2018年 上海屋聚公共租赁住房运营有限公司. All rights reserved.
//

import UIKit

class ImagePresentiveCell: UITableViewCell {

  @IBOutlet weak var itemLabel: UILabel!
  @IBOutlet weak var itemImageView: UIImageView!
  
  static let reuseID = "ImagePresentiveCell"

  var itemValue: String = "" {
    didSet{
      itemLabel.text = itemValue
    }
  }
  
  var itemImage: UIImage = UIImage() {
    didSet{
      itemImageView.image = itemImage
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    itemLabel.ez.regular(size: 15, color: .c333333)
    
  }


}
