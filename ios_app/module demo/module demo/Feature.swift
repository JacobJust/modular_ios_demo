//
//  Feature.swift
//  module demo
//
//  Created by Jacob Just on 31/01/2019.
//  Copyright © 2019 Jacob Just. All rights reserved.
//

import UIKit

public protocol FeatureContract {
    func tabBarName() -> String
    func getImageName() -> String
    func getMainViewController() -> UIViewController
    func identifier() -> String
}
