//
//  Appearance.swift
//  APCHome
//
//  Created by Greg on 10/09/2018.
//  Copyright © 2018 Lunabee Studio. All rights reserved.
//

import UIKit


struct Appearance {
    static let mainColor: UIColor = greenColor
    static let secondaryColor: UIColor = blueColor
    static let darkGray = UIColor(red: 0.38, green: 0.39, blue: 0.41, alpha: 1)

    private static let greenColor = UIColor(red: 0.24, green: 0.8, blue: 0.35, alpha: 1)
    private static let blueColor = #colorLiteral(red: 0.3843137255, green: 0.7019607843, blue: 0.8823529412, alpha: 1)
    
    
    static func setup() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.tintColor = UIColor.white
        navAppearance.barTintColor = Appearance.mainColor
        navAppearance.isTranslucent = false
        navAppearance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let barButtonAppearance = UIBarButtonItem.appearance()
        barButtonAppearance.tintColor = .white
        UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = .white
        barButtonAppearance.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor: UIColor.white],
            for: .normal)
        
        UITextField.appearance().tintColor = Appearance.mainColor
        
    }
}
