

import Foundation
import UIKit

public class FeatureC: FeatureContract {
    public override func tabBarName() -> String {
        return "Sausage"
    }
    
    public override func getImageName() -> String {
        return "icn_poelse"
    }
    
    public override func getMainViewController() -> UIViewController {
        return ViewControllerC()
    }
    
    public override func identifier() -> String {
        return "C"
    }
}
