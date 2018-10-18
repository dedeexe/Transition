//
//  PopAnimation.swift
//  CyberPunkGuide
//
//  Created by dede.exe on 18/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class ScrollAnimation : NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var advancing : Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        guard let sourceView = transitionContext.view(forKey: .from) else { return }
        guard let destinationView = transitionContext.view(forKey: .to) else { return }
        
        containerView.addSubview(sourceView)
        containerView.addSubview(destinationView)
        
        destinationView.frame.origin.y = containerView.frame.size.height
        
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseOut,
                       animations: {
                            destinationView.frame.origin.y = 0
                            sourceView.frame.origin.y = -containerView.frame.size.height
                        },
                       completion: { _ in
                            transitionContext.completeTransition(true)
                        })
        
    }
}
