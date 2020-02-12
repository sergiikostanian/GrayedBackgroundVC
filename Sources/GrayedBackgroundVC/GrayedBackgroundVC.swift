//
//  GrayedBackgroundVC.swift
//
//  Created by Sergii Kostanian on 9/18/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

/**
 This class is made for presenting view controllers modally with background graying out effect. Everything you need is just subclass from this class. Dismissing with reverted animation will also work without any additional setup.
 */
public class GrayedBackgroundVC: UIViewController {
    
    private let animator = GrayedBackgroundModalAnimator()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    private func initialSetup() {
        transitioningDelegate = self
        modalPresentationStyle = .overFullScreen
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }  
}

extension GrayedBackgroundVC: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.isPresenting = true
        return animator
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.isPresenting = false
        return animator
    }
}
