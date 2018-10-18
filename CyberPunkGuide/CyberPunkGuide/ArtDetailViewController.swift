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

    var art : CyberArt?
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func update() {
        self.imageView.image = UIImage(named:art?.image ?? "")
        self.titleLabel.text = art?.title
        self.descriptionLabel.text = art?.description
    }
    
    
    
}
