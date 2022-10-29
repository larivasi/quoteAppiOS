//
//  TabBarController.swift
//  quoteApp
//
//  Created by Vasyl Larin on 29.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: MainViewController(),
                title: "Main",
                image: UIImage(systemName: "house.fill"))
//            ),
//            generateVC(
//                viewController: TeamDescriptionViewController(),
//                title: "Team",
//                image: UIImage(systemName: "person.fill")
//            )
        ]
    }
    
    private func generateVC(
        viewController: UIViewController,
        title: String,
        image: UIImage?
    ) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let roundLayer = CAShapeLayer()
        
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 2
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.tabBarMain.cgColor
        roundLayer.opacity = 0.5
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabbarItemLight
    }
}

extension UIColor {
    static var tabBarItemAccent: UIColor {
        #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    
    static var tabBarMain: UIColor {
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    static var tabbarItemLight: UIColor {
        #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.5)
    }
}

