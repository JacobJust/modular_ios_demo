

import Foundation
import UIKit

public class FeatureB: FeatureContract {
    public func tabBarName() -> String {
        return "Burger"
    }
    
    public func getImageName() -> String {
        return "icn_tab_burger"
    }
    
    public func getMainViewController() -> UIViewController {
        return ViewControllerB()
    }
    
    public func identifier() -> String {
        return "B"
    }
    
}
