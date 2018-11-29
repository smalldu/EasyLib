//
//  AboutApp.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import Foundation
import UIKit
import AdSupport

public struct App {
  
  public static var appName: String {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
  }
  
  public static var appVersion: String {
    return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
  }
  
  public static var appBuild: String {
    return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
  }
  
  public static var bundleIdentifier: String {
    return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
  }
  
  public static var bundleName: String {
    return Bundle.main.infoDictionary!["CFBundleName"] as! String
  }
  
  public static var appStoreURL: URL {
    return URL(string: "https://itunes.apple.com/cn/app/zuber-zhuan-ye-zhao-shi-you/id1035547502?mt=8")!
  }
  
  public static var appVersionAndBuild: String {
    let version = appVersion, build = appBuild
    return version == build ? "v\(version)" : "v\(version)(\(build))"
  }
  
  public static var IDFA: String {
    return ASIdentifierManager.shared().advertisingIdentifier.uuidString
  }
  
  public static var IDFV: String {
    return UIDevice.current.identifierForVendor!.uuidString
  }
  
  public static var screenOrientation: UIInterfaceOrientation {
    return UIApplication.shared.statusBarOrientation
  }
  
  public static var screenStatusBarHeight: CGFloat {
    return UIApplication.shared.statusBarFrame.height
  }
  
  public static var screenHeightWithoutStatusBar: CGFloat {
    if UIInterfaceOrientationIsPortrait(screenOrientation) {
      return UIScreen.main.bounds.size.height - screenStatusBarHeight
    } else {
      return UIScreen.main.bounds.size.width - screenStatusBarHeight
    }
  }
}

