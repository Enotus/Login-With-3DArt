//
//  PresentLogin.swift
//  LoginWith3DArt
//
//  Created by Enotus on 02/05/2018.
//  Copyright © 2018 enotus. All rights reserved.
//

import UIKit

class PresentLogin: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var presenting = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let duration = transitionDuration(using: transitionContext)
        
        let containerView = transitionContext.containerView
        let loginViewController = (presenting ? transitionContext.viewController(forKey: .to) : transitionContext.viewController(forKey: .from)) as! LoginViewController
        
        containerView.addSubview(loginViewController.view)
        
        // Initial state
        if self.presenting {
            loginViewController.background.alpha = 0.0
            loginViewController.loginContainerTop.constant = UIScreen.main.bounds.height
//            loginViewController.scnView.alpha = 0.0
        }
        
        containerView.layoutIfNeeded()
        
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8) {
            // Final state
            loginViewController.background.alpha = self.presenting ? 0.8 : 0.0
            loginViewController.loginContainerTop.constant = self.presenting ? 48 : UIScreen.main.bounds.height
            containerView.layoutIfNeeded()
            
//            loginViewController.scnView.alpha = self.presenting ? 1.0 : 0.0
        }

        animator.addCompletion { (finished) in
            // Completion
            transitionContext.completeTransition(true)
        }

        animator.startAnimation()
    }
    
}

extension PresentLogin: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
