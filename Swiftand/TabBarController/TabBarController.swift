//
//  TabBarController.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit

enum TabBarControllerString: String {
    case homeTitle = "Home"
    case homeImage = "wrench.and.screwdriver.fill"
    case profileTitle = "Perfil"
    case profileImage = "person"
    case calendarTitle = "Agenda"
    case calendarImage = "calendar"
}

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        let calendarVC = UINavigationController(rootViewController: CalendarViewController())

        self.setViewControllers([profileVC, homeVC, calendarVC], animated: true)
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .black
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 82/255, green: 87/255, blue: 89/255, alpha: 1)
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .white
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: TabBarControllerString.profileImage.rawValue)
        items[0].title = TabBarControllerString.profileTitle.rawValue

        items[1].image = UIImage(systemName:TabBarControllerString.homeImage.rawValue)
        items[1].title = TabBarControllerString.homeTitle.rawValue
        
        items[2].image = UIImage(systemName:TabBarControllerString.calendarImage.rawValue)
        items[2].title = TabBarControllerString.calendarTitle.rawValue
    }

}
