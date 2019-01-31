

import Foundation
import UIKit

public class FeatureA: FeatureContract {
    public func tabBarName() -> String {
        return "Pommes"
    }
    
    public func getImageName() -> String {
        return "icn_pommes"
    }
    
    public func getMainViewController() -> UIViewController {
        return ViewControllerA()
    }
    public func identifier() -> String {
        return "A"
    }
    
}
