//
//  ArtDetailViewController.swift
//  CyberPunkGuide
//
//  Created by dede.exe on 17/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class ArtDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var bottomConstraint : NSLayoutConstraint!
    @IBOutlet weak var descriptionView : UIView!
    @IBOutlet weak var contentView : UIView!

    var art : CyberArt?
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        setupInitialPosition()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showDescriptionView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.dismiss(animated: true, completion: nil)
        hideDescriptionView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func update() {
        self.imageView.image = UIImage(named:art?.image ?? "")
        self.titleLabel.text = art?.title
        self.descriptionLabel.text = art?.description
    }
    
    
    private func setupInitialPosition() {
        bottomConstraint.constant = -view.frame.height
        view.layoutIfNeeded()
    }
    
    func showDescriptionView() {
        
        UIView.animate(withDuration: 0.4,
                       animations: { [weak self] in
                            self?.bottomConstraint.constant = 0.0
                            self?.view.layoutIfNeeded()
                        },
                       completion: nil)
        

    }
    
    func hideDescriptionView() {
        
        UIView.animate(withDuration: 0.4,
                       animations: { [weak self] in
                            self?.setupInitialPosition()
                        },
                       completion: { [weak self] _ in
                            self?.dismiss(animated: true, completion: nil)
                        })
    }
    
}
