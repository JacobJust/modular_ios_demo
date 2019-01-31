import UIKit

class TabBarController: UITabBarController {
    
    let viewControllerA = ViewControllerA()
    let viewControllerB = ViewControllerB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemA = UITabBarItem(title: "Tasty burger", image: UIImage(named: "icn_tab_burger"), tag: 0)
        viewControllerA.tabBarItem = itemA
        
        let itemB = UITabBarItem(title: "Tasty Fries", image: UIImage(named: "icn_pommes"), tag: 0)
        viewControllerB.tabBarItem = itemB
        viewControllers = [viewControllerA, viewControllerB]
    }

}
