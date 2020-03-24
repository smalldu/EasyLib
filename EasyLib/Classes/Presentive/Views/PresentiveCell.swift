//
//  PresentiveCell.swift
//  PresentUI
//
//  Created by 上海屋聚公共租赁住房运营有限公司 on 2018/2/24.
//  Copyright © 2018年 上海屋聚公共租赁住房运营有限公司. All rights reserved.
//

import UIKit

class PresentiveCell: UITableViewCell {
  
  static let reuseID = "PresentiveCell"
  
  @IBOutlet weak var contentLabel: UILabel!
  
  var title: String = ""{
    didSet{
      selectionStyle = .none
      contentLabel.font = UIFont.regularOf(12)
      if #available(iOS 13, *) {
        contentLabel.textColor = UIColor.label
      }else{
        contentLabel.textColor = UIColor.cb2b2b2
      }
      contentLabel.text = title
    }
  }
  
  var content: String = "" {
    didSet{
      selectionStyle = .default
      contentLabel.font = UIFont.regularOf(15)
      if #available(iOS 13, *) {
        contentLabel.textColor = UIColor.label
      }else{
        contentLabel.textColor = UIColor.c333333
      }
      contentLabel.text = content
    }
  }
  
  var attributeText: NSMutableAttributedString? {
    didSet{
      self.contentLabel.attributedText = attributeText
    }
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    contentLabel.textAlignment = .center
    contentLabel.numberOfLines = 0
    if #available(iOS 13, *) {
      contentView.backgroundColor = UIColor.systemBackground
    }else{
      contentView.backgroundColor = .white
    }
  }
  
  
}

