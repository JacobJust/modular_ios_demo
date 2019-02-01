//
//  ModuleCollectionViewCell.swift
//  BurgerApp
//
//  Created by Glussian on 1/2/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit
//import MaterialComponents.MaterialShadowElevations

class ModuleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var moduleTitle: UILabel?
    @IBOutlet var moduleStatus: UILabel?
    @IBOutlet var moduleImageView: UIImageView?
    @IBOutlet var moduleProgressBar: UIProgressView?
    @IBOutlet var moduleDownloadButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moduleDownloadButton?.setTitleColor(Appearance.secondaryColor, for: .normal)
        moduleProgressBar?.progressTintColor = Appearance.secondaryColor
        
        
        
        
//        (self.layer as! MDCShadowLayer).elevation = ShadowElevation(10)
//        (self.layer as! MDCShadowLayer).shadowColor = UIColor.black.withAlphaComponent(0.50).cgColor
        //Improve performance of elevation
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 8
    }
    
//    override class var layerClass: AnyClass {
//        return MDCShadowLayer.self
//    }
    
    override var isHighlighted: Bool {
        didSet {
            
            if moduleImageView!.alpha == 1 {
                if oldValue != isHighlighted {
                    UIView.animate(withDuration: 0.1) {
                        let ratio: CGFloat = self.isHighlighted ? 0.95 : 1
                        self.transform = CGAffineTransform(scaleX: ratio, y: ratio)
                    }
                }
            }
            
            
        }
    }
    
}
