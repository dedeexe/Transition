//
//  ArtView.swift
//  CyberPunkGuide
//
//  Created by dede.exe on 17/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class ArtView: UIView {
    
    @IBOutlet private var contentView : UIView!
    @IBOutlet private var imageView : UIImageView!
    @IBOutlet private var titleLabel : UILabel!
    
    var art : CyberArt? {
        didSet { upload() }
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        Bundle.main.loadNibNamed("ArtView", owner: self, options: nil)
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.frame = contentView.bounds
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.bounds
        upload()
    }
    
    private func upload() {
        imageView.contentMode = .scaleAspectFill
        let image = UIImage(named: art?.image ?? "")
        imageView.image = image
        titleLabel.text = art?.title
    }

}
