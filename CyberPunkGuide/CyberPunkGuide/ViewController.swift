//
//  ViewController.swift
//  CyberPunkGuide
//
//  Created by dede.exe on 17/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView : ArtScrollView!
    let fadeTransition = FadeAnimation()                    //Add the transition properties
    let scrollTransition = ScrollAnimation()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setArtAction()
        scrollView.backgroundColor = UIColor.clear
        scrollView.arts = createArts()
    }
    
    private func setArtAction() {
        scrollView.onSelectArt = { [weak self] artView in
            
            guard let destail = self?.storyboard?.instantiateViewController(withIdentifier: "ArtDetailViewController") as? ArtDetailViewController else {
                fatalError()
            }
            
            destail.art = artView.art
            destail.transitioningDelegate = self                //Set the destination transition delegate
            self?.present(destail, animated: true, completion: nil)
        }
    }
    
}

//MARK: - Transition Delegate
extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //fadeTransition.advancing = true
        scrollTransition.advancing = true
        return scrollTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        fadeTransition.advancing = false
        return fadeTransition
    }
}
