//
//  GrayedBackgroundModalAnimator.swift
//
//  Created by Sergii Kostanian on 9/18/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

internal class GrayedBackgroundModalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let grayedView = UIView(frame: UIScreen.main.bounds)
    private let grayedViewFinalAlpha: CGFloat = 0.5
    private let transitionDuration: TimeInterval = 0.3
    
    internal var isPresenting: Bool = true
        
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animatePresentation(using: transitionContext)
        } else {
            animateDismission(using: transitionContext)
        }
    }
    
    private func animatePresentation(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        
        if !(fromVC is GrayedBackgroundVC) {
            grayedView.backgroundColor = .black
            grayedView.alpha = 0
            transitionContext.containerView.addSubview(grayedView)
        }
        
        toVC.view.transform = CGAffineTransform(translationX: 0, y: toVC.view.frame.height)
        transitionContext.containerView.addSubview(toVC.view)
        
        UIView.animate(withDuration: transitionDuration, animations: {
            if !(fromVC is GrayedBackgroundVC) {
                self.grayedView.alpha = 0.5
            }
            toVC.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
    
    private func animateDismission(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        
        UIView.animate(withDuration: transitionDuration, animations: {
            if !(toVC is GrayedBackgroundVC) {
                self.grayedView.alpha = 0
            }
            fromVC.view.transform = CGAffineTransform(translationX: 0, y: fromVC.view.frame.height)
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }    
}
