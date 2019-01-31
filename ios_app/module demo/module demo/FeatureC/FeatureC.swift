

import Foundation
import UIKit

public class FeatureC: FeatureContract {
    public func tabBarName() -> String {
        return "Sausage"
    }
    
    public func getImageName() -> String {
        return "icn_poelse"
    }
    
    public func getMainViewController() -> UIViewController {
        return ViewControllerC()
    }
    
    public func identifier() -> String {
        return "C"
    }
}
