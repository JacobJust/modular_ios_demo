

import Foundation
import UIKit

public class FeatureB: FeatureContract {
    public override func tabBarName() -> String {
        return "Burger"
    }
    
    public override func getImageName() -> String {
        return "icn_tab_burger"
    }
    
    public override func getMainViewController() -> UIViewController {
        return ViewControllerB()
    }
    
    public override func identifier() -> String {
        return "B"
    }
    
}
