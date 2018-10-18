//
//  FadeAnimation.swift
//  CyberPunkGuide
//
//  Created by dede.exe on 18/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class FadeAnimation : NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var advancing : Bool = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let contextView = transitionContext.containerView
        guard let destinationView = transitionContext.view(forKey: .to) else { return }
        
        let targetView = destinationView
        
        contextView.addSubview(targetView)
        destinationView.frame = contextView.frame
        destinationView.alpha = 0.0
        
        UIView.animate(withDuration: duration,
                       animations: { targetView.alpha = 1.0 },
                       completion: { _ in transitionContext.completeTransition(true) })
    }
    
    
}
