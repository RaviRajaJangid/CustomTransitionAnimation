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
        return CustomPresenterTransitioningAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismisalTransitioningAnimator()
    }
}

class CustomPresenterTransitioningAnimator: NSObject, UIViewControllerAnimatedTransitioning  {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.50
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to) else {
            return
        }
        
        if let tabVC = toVC as? UITabBarController, let transiningVC = tabVC.viewControllers?.first  as? TransiningDelegate {
            
            transiningVC.animatableImageHeightConstraint?.constant = transiningVC.startingImageHeightConstraint
            transiningVC.view.layoutIfNeeded()
            transiningVC.animatableRatingViewWidthConstraint?.constant = transiningVC.startingRatingViewWidthConstraint
            transiningVC.view.layoutIfNeeded()
            
        } else {
            print("ERROR: Transining Delegate not followed")
            return
        }
        let duration = transitionDuration(using: transitionContext)
        transitionContext.containerView.addSubview(toView)
        toView.alpha = 0.0
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            toView.alpha = 1
            toView.layoutIfNeeded()
            if let tabVC = toVC as? UITabBarController, let transiningVC = tabVC.viewControllers?.first  as? TransiningDelegate {
                
                transiningVC.animatableImageHeightConstraint?.constant = transiningVC.endImageHeightConstraint
                toView.layoutIfNeeded()
                transiningVC.animatableRatingViewWidthConstraint?.constant = transiningVC.endRatingViewWidthConstraint
                toView.layoutIfNeeded()
            }
            
        }) { finished in
            transitionContext.completeTransition(true)
        }
    }
}


class CustomDismisalTransitioningAnimator: NSObject, UIViewControllerAnimatedTransitioning  {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.30
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
        UIView.animate(withDuration: duration, animations: {
            fromVC.view.alpha = 0
            if let tabVC = fromVC as? UITabBarController, let transiningVC = tabVC.viewControllers?.first  as? TransiningDelegate {
                
                transiningVC.animatableImageHeightConstraint?.constant = transiningVC.startingImageHeightConstraint
                fromVC.view.layoutIfNeeded()
                transiningVC.animatableRatingViewWidthConstraint?.constant = transiningVC.startingRatingViewWidthConstraint
                fromVC.view.layoutIfNeeded()
            }else {
                print("ERROR: Transining Delegate not followed")
            }
        }) { finished in
            transitionContext.completeTransition(true)
            fromVC.view.removeFromSuperview()
        }
    }
    
    
}
