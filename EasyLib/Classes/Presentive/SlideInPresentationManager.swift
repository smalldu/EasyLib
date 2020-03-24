//
//  SlideInPresentationManager.swift
//  MedalCount
//
//  Created by 上海屋聚公共租赁住房运营有限公司 on 2017/6/1.
//  Copyright © 2017年 Ron Kliffer. All rights reserved.
//

import UIKit

enum PresentionDirection{
  case left
  case top
  case right
  case bottom
}

class SlideInPresentationManager: NSObject {
  var direction = PresentionDirection.left
  var isMoveTogher = false
}


// MARK: - UIViewControllerTransitioningDelegate

extension SlideInPresentationManager: UIViewControllerTransitioningDelegate {
  
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    let presentController = SlideInPresentationController(presentedViewController: presented, presenting: presenting, direction: direction)
    return presentController
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return SlideInPresentationAnimator(direction: direction, isPresentation: true , isMoveTogher:isMoveTogher)
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return SlideInPresentationAnimator(direction: direction, isPresentation: false , isMoveTogher:isMoveTogher)
  }
  
//  func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//    return swipeInteractionController.interactionInProgress ? swipeInteractionController : nil
//  }
//  
//  func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//    return swipeInteractionController.interactionInProgress ? swipeInteractionController : nil
//  }
}
