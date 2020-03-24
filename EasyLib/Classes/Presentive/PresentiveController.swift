//
//  PresentiveController.swift
//  EasyLib
//
//  Created by zuber on 2020/3/23.
//

import UIKit

public enum PresentiveType {
  case text(String)
  case imageText(String,UIImage)
  case attribute(NSMutableAttributedString)
  
  public var value: String {
    switch self {
    case .text(let value):
      return value
    case .imageText(let value, _):
      return value
    case .attribute(let attr):
      return attr.string
    }
  }
}


class PresentiveController: UIViewController {
  
  enum SectionType {
    case title
    case content
    case cancel
  }
  
  let tableView: UITableView = {
    let tbView = UITableView()
    
    return tbView
  }()
  private let rowHeight: CGFloat = 50
  private let titleHeight: CGFloat = 30
  
  private var items: [PresentiveType] = []
  private var presentTitle: String
  
  private var sections: [SectionType]
  var clickItems:((_ item: Int)->())?
  
  init(title: String,items: [PresentiveType]){
    self.items = items
    self.presentTitle = title
    if title.isEmpty {
      sections = [ .content , .cancel ]
    }else{
      sections = [ .title , .content , .cancel ]
    }
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    layoutUI()
  }
  
}


// MARK: - setup

extension PresentiveController {
  
  func layoutUI(){
    view.backgroundColor = UIColor.clear
    
    var height = CGFloat(items.count+1)*rowHeight+2
    if sections.contains(.title) {
      height += titleHeight
    }
    preferredContentSize = CGSize(width: self.view.bounds.size.width, height: height)
    
    view.addSubview(tableView)
    tableView.frame = view.bounds
    tableView.separatorInset = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 0)
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    tableView.isScrollEnabled = false
    tableView.separatorColor = UIColor(white: 0.8, alpha: 0.5)
    
    let bundle = Bundle(for: type(of: self))
    let path = bundle.path(forResource: "EasyLib", ofType: "bundle")
    let easyBundle = Bundle(path: path ?? "")
    tableView.register(UINib(nibName: "PresentiveCell", bundle: easyBundle), forCellReuseIdentifier: PresentiveCell.reuseID)
    tableView.register(UINib(nibName: "ImagePresentiveCell", bundle: easyBundle), forCellReuseIdentifier: ImagePresentiveCell.reuseID)
    
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = UIColor.white
  }
  
}



// MARK: - UITableViewDataSource,UITableViewDelegate

extension PresentiveController: UITableViewDataSource,UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch sections[indexPath.section] {
    case .title:
      let cell = tableView.dequeueReusableCell(withIdentifier: PresentiveCell.reuseID , for: indexPath) as! PresentiveCell
      cell.title = self.presentTitle
      return cell
    case .content:
      let item = items[indexPath.row]
      switch item{
      case .imageText(let value, let image):
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagePresentiveCell.reuseID , for: indexPath) as! ImagePresentiveCell
        cell.itemImage = image
        cell.itemValue = value
        return cell
      case .text(let text):
        let cell = tableView.dequeueReusableCell(withIdentifier: PresentiveCell.reuseID , for: indexPath) as! PresentiveCell
        cell.content = text
        return cell
      case .attribute(let attr):
        let cell = tableView.dequeueReusableCell(withIdentifier: PresentiveCell.reuseID , for: indexPath) as! PresentiveCell
        cell.attributeText = attr
        return cell
      }
    case .cancel:
      let cell = tableView.dequeueReusableCell(withIdentifier: PresentiveCell.reuseID , for: indexPath) as! PresentiveCell
      cell.content = "取消"
      return cell
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch sections[ section ] {
    case .content:
      return items.count
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch sections[indexPath.section] {
    case .title:
      return titleHeight
    default:
      return rowHeight
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    switch sections[ section ] {
    case .cancel:
      let v = UIView()
      v.backgroundColor = UIColor(white: 0.5, alpha: 0.25)
      return v
    default:
      return nil
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch sections[ section ] {
    case .cancel:
      return 5
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    switch sections[ indexPath.section ] {
    case .content:
      self.dismiss(animated: true){ [weak self] in
        guard let `self` = self else{ return }
        self.clickItems?(indexPath.row)
      }
    case .cancel:
      self.dismiss(animated: true, completion: nil)
    default:
      break
    }
  }
  
}
