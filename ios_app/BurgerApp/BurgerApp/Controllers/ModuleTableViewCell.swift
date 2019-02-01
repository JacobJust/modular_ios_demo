//
//  ModuleTableViewCell.swift
//  BurgerApp
//
//  Created by Glussian on 31/1/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit

class ModuleTableViewCell: UITableViewCell {

    @IBOutlet var moduleTitle: UILabel?
    @IBOutlet var moduleStatus: UILabel?
    @IBOutlet var moduleIconImageView: UIImageView?
    @IBOutlet var moduleProgressBar: UIProgressView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
