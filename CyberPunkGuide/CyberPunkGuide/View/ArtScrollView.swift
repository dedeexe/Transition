//
//  ArtScrollView.swift
//  CyberPunkGuide
//
//  Created by dede.exe on 17/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class ArtScrollView: UIScrollView {
    
    let padding : CGFloat = 10.0
    var onSelectArt : ((ArtView) -> Void)?
    
    var arts: [CyberArt] = [] {
        didSet {
            removeArts()
            insertArts()
            update()
        }
    }
    
    func removeArts() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func insertArts() {
        for (index, art) in arts.enumerated() {
            let artView = ArtView()
            self.addSubview(artView)
            artView.tag = index
            artView.art = art
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectArt))
            artView.addGestureRecognizer(tapGesture)
        }
    }
    
    func update() {
        let width = self.frame.size.height * 0.75
        let height = self.frame.height
        
        let contentWidth = (width + padding) * CGFloat(self.subviews.count) + padding
        contentSize = CGSize(width: contentWidth, height: height)
        
        for (index, view) in self.subviews.enumerated() {
            let posX = CGFloat(index) * (width + padding) + padding
            view.frame = CGRect(x: posX, y: 0, width: width, height: height)
            view.backgroundColor = UIColor.blue
            view.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func hideArt(tag:Int) {
        guard let artView = self.viewWithTag(tag) else { return }
        artView.isHidden = true
    }

    func showArt(tag:Int) {
        guard let artView = self.viewWithTag(tag) else { return }
        artView.isHidden = false
    }
    
    @objc func selectArt(sender:UITapGestureRecognizer) {
        guard let artView = sender.view as? ArtView else { return }
        onSelectArt?(artView)
    }
    
}
