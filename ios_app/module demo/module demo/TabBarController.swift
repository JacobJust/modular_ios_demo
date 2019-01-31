import UIKit

class TabBarController: UITabBarController {
    
    let viewControllerA = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemA = UITabBarItem(title: "A", image: nil, tag: 0)
        viewControllerA.tabBarItem = itemA
        viewControllers = [viewControllerA]
    }
    
}
