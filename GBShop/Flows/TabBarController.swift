//
//  TabBarController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private var controllers: [UIViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    init(controllers: [UIViewController]) {
        self.controllers = controllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            return true
    }
    
    private func setupAppearance() {
        
        let positionOnX: CGFloat = 30
        let positionOnY: CGFloat = 5
        
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY, width: width, height: height), cornerRadius: height/2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.cyan.cgColor
        
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = .clear
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemBlue
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
    }
}
