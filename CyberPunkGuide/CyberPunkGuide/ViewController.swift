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
    let popTransition = PopAnimation()
    
    var selectedArtView : ArtView?
    
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

            self?.popTransition.startingFrame = artView.superview?.convert(artView.frame, to: nil) ?? CGRect.zero
            self?.selectedArtView = artView
            self?.selectedArtView?.isHidden = true
            
            destail.transitioningDelegate = self                //Set the destination transition delegate
            destail.art = artView.art
            self?.present(destail, animated: true, completion: nil)
        }
        
        popTransition.onFinishTransition = { [weak self] in
            self?.selectedArtView?.isHidden = false
        }
    }
    
}

//MARK: - Transition Delegate
extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //fadeTransition.advancing = true
        //scrollTransition.advancing = true
        popTransition.advancing = true
        return popTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //fadeTransition.advancing = false
        //scrollTransition.advancing = false
        popTransition.advancing = false
        return popTransition
    }
}
