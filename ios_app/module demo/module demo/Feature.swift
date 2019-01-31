//
//  Feature.swift
//  module demo
//
//  Created by Jacob Just on 31/01/2019.
//  Copyright © 2019 Jacob Just. All rights reserved.
//

import UIKit

@objc
public class FeatureContract: NSObject {
    
    public required override init() {
        super.init()
    }
    
    func tabBarName() -> String {
        return nil!
    }
    
    func getImageName() -> String {
        return nil!
    }
    
    func getMainViewController() -> UIViewController {
        return nil!
    }
    
    func identifier() -> String {
        return nil!
    }
}
