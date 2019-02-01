

import Foundation
import UIKit


public class FeatureA: FeatureContract {
    @objc
    public override func tabBarName() -> String {
        return "Pommes"
    }
    
    @objc
    public override func getImageName() -> String {
        return "icn_pommes"
    }
    
    @objc
    public override func getMainViewController() -> UIViewController {
        return ViewControllerA()
    }
    
    @objc
    public override func identifier() -> String {
        return "A"
    }
    
}
