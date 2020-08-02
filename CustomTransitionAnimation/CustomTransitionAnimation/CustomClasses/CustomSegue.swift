//
//  CustomSegue.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 01/08/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension CustomSegue: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentorTransitioningAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismisalTransitioningAnimator()
    }
}

class CustomPresentorTransitioningAnimator: NSObject, UIViewControllerAnimatedTransitioning  {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to) else {
            return
        }
        
        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toVC)
        transitionContext.containerView.addSubview(toView)
        toView.frame =  CGRect(x: 0, y: 0, width:finalFrame.size.width , height: finalFrame.size.height/1.4 )
        toView.alpha = 0.0
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            toView.alpha = 1
            toView.frame = finalFrame
            toView.layoutIfNeeded()
        }) { finished in
            transitionContext.completeTransition(true)
        }
    }
}


class CustomDismisalTransitioningAnimator: NSObject, UIViewControllerAnimatedTransitioning  {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.50
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to)
            
            else {
                return
        }
        let containerView = transitionContext.containerView
        containerView.insertSubview(toVC.view, at: 0)
        toVC.view.layoutIfNeeded()
        let duration = transitionDuration(using: transitionContext)
        let frame = transitionContext.finalFrame(for: toVC)
        let finalFrame = CGRect(x: 0, y: 0, width:frame.size.width , height: frame.size.height/1.4 )
        
        UIView.animate(withDuration: duration, animations: {
            fromVC.view.alpha = 0
            fromVC.view.frame = finalFrame
            fromVC.view.layoutIfNeeded()
        }) { finished in
            transitionContext.completeTransition(true)
            fromVC.view.removeFromSuperview()
        }
    }
    
    
}
