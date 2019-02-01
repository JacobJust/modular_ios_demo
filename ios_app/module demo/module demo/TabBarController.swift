import UIKit

class TabBarController: UITabBarController, ComponentServiceProvider, UserServiceProvider {
    
    lazy var componentService: ComponentService = {
        return self.getComponentService()
    }()
    
    lazy var userService: UserService = {
        return self.getUserService()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let features = componentService.getFeatures(featureIdentifier: userService.getFeatureIdentifiers())
        
        var controllers: [UIViewController] = []
        
        var count = 0
        
        for feature in features {
            let name = feature.tabBarName()
            let imageName = feature.getImageName()
            let viewController = feature.getMainViewController()
            
            controllers.append(viewController)
            
            viewController.tabBarItem = UITabBarItem(title: name, image: UIImage(named: imageName), tag: count)
            count = count + 1
        }
        
        viewControllers = controllers
    }
}
