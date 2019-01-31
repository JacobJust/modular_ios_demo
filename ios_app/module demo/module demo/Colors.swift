//
//  Colors.swift
//  IvanApp
//
//  Created by Kasper T on 25/08/16.
//  Copyright © 2016 Trifork a/s. All rights reserved.
//

import Foundation
import UIKit

//purpose, to make it 100% clear what colors we "have".

public class Colors {

    public static let widgetRed = UIColor(red: 0.8611, green: 0.0, blue: 0.0892, alpha: 1.0)
    public static let widgetGreen = UIColor(red: 0.0854, green: 0.5226, blue: 0.1545, alpha: 1.0)
    public static let widgetBlue = UIColor(red: 0.302, green: 0.4588, blue: 0.9451, alpha: 1.0)
    public static let widgetYellow = UIColor(red: 255 / 255, green: 209 / 255, blue: 0 / 255, alpha: 1)
    public static let widgetGrey = UIColor(red: 0x4A / 0xFF, green: 0x4A / 0xFF, blue: 0x4A / 0xFF, alpha: 1)
    public static let widgetDefaultColor = UIColor(red: 0.8706, green: 0.0, blue: 0.0196, alpha: 1.0)
    public static let widgetDarkGrey = UIColor(red: 0x1A / 0xFF, green: 0x1A / 0xFF, blue: 0x1A / 0xFF, alpha: 1)
    public static let widgetLightGrey = UIColor(red: 0xE5 / 0xFF, green: 0xE5 / 0xFF, blue: 0xE5 / 0xFF, alpha: 1)
    public static let newFeatureColor = UIColor.init(red: 100 / 255, green: 200 / 255, blue: 45 / 255, alpha: 1)
    public static let bannerRed = UIColor(red: 0xDC / 0xFF, green: 0x0A / 0xFF, blue: 0x0A / 0xFF, alpha: 1)
    public static let bannerOrange = UIColor(red: 240 / 255, green: 145 / 255, blue: 54 / 255, alpha: 1)
    public static let grayedOut = UIColor(red: 237 / 255, green: 237 / 255, blue: 237 / 255, alpha: 1)
    public static let gradiantFrom = UIColor(red: 0xD5 / 0xFF, green: 0xD5 / 0xFF, blue: 0xD5 / 0xFF, alpha: 1)
    public static let gradiantTo = UIColor(red: 0xFF / 0xFF, green: 0xFF / 0xFF, blue: 0xFF / 0xFF, alpha: 1)
    
    public static func whiteOpacity() -> UIColor? {
        return UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
    }
    public static func white() -> UIColor? {
        return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    public static func authBackgroundGreen() -> UIColor? {
        return UIColor(red: 0.000, green: 0.573, blue: 0.220, alpha: 1)
    }
    
    public static func authBtnColorGreen() -> UIColor? {
        return UIColor(red: 0.000, green: 0.529, blue: 0.125, alpha: 1)
    }
    
    static func titleColor() -> UIColor? {
        return UIColor.darkGray
    }
    
    static func textColor() -> UIColor? {
        return UIColor.gray
    }
}
