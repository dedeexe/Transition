//
//  PopAnimation.swift
//  CyberPunkGuide
//
//  Created by Fabricio Santos on 18/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class PopAnimation : NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.75
    var bounce = 0.8
    var advancing = true
    var startingFrame = CGRect.zero
    
    var onFinishTransition: (()->Void)?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let advancing = self.advancing
        let contentView = transitionContext.containerView
        
        guard let sourceView        = transitionContext.view(forKey: .from) else { return }
        guard let destinationView   = transitionContext.view(forKey: .to) else { return }
        
        var transitionView = destinationView
        
        if !advancing {
            transitionView = sourceView
        }
        
        contentView.addSubview(destinationView)
        contentView.addSubview(transitionView)
        
        var initialFrame = startingFrame
        var finalFrame = transitionView.frame
        var xScale = initialFrame.width / finalFrame.width
        var yScale = initialFrame.height / finalFrame.height
        
        if !advancing {
            initialFrame = transitionView.frame
            finalFrame = startingFrame
            xScale = finalFrame.width / initialFrame.width
            yScale = finalFrame.height / initialFrame.height
        }

        let transformaScale = CGAffineTransform(scaleX: xScale, y: yScale)
        
        if advancing {
            transitionView.transform = transformaScale
            transitionView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            transitionView.clipsToBounds = true
        }
        
        let damping = min(max(0.1, bounce), 1.0) * duration
        
        
        var transformation = transformaScale
        let centerPoint = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        
        if advancing {
            transformation = CGAffineTransform.identity
        }
        
        
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       usingSpringWithDamping: CGFloat(damping),
                       initialSpringVelocity: 0.0,
                       options: .curveEaseIn,
                       animations: {
                            transitionView.transform = transformation
                            transitionView.center = centerPoint
                        },
                       completion: { [weak self] _ in
                            transitionContext.completeTransition(true)
                            if !advancing { self?.onFinishTransition?()}
                        }
                    )
    }
    
    
}
