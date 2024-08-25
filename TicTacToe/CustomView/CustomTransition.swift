//
//  CustomTransition.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 22/08/24.
//

import UIKit

class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        toVC.view.alpha = 0
        containerView.addSubview(toVC.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromVC.view.alpha = 0
            toVC.view.alpha = 1
        }) { finished in
            fromVC.view.alpha = 1
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
