//
//  TabBarViewController.swift
//  quoteApp
//
//  Created by Vasyl Larin on 28.10.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        
        // Do any additional setup after loading the view.
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: ViewController(), title: "Quote", image: <#T##UIImage?#>)
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title,
        viewController.tabBarItem.image = image
        return viewController
    }

}
