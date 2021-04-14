//
//  MainTabBarController.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    
    
    //MARK: - Handle Action
    private func configureViewControllers(){
        self.delegate = self
        
        let home = templateNavigationController(titleText: "Home", unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeViewController())
        let feed = templateNavigationController(titleText: "Feed", unselectedImage: #imageLiteral(resourceName: "feed"), selectImage: #imageLiteral(resourceName: "feed"), rootViewController: FeedViewController())
        let message = templateNavigationController(titleText: "Message", unselectedImage: #imageLiteral(resourceName: "message"), selectImage: #imageLiteral(resourceName: "message"), rootViewController: MessageViewController())
        let search = templateNavigationController(titleText: "Search", unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchViewController())
        let profile = templateNavigationController(titleText: "Profile", unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileViewController())
        
        viewControllers = [home,feed,message,search, profile]
        tabBar.tintColor = #colorLiteral(red: 0.3787218928, green: 0.3692588806, blue: 0.9188019633, alpha: 1)
    }
    
    //TODO: - templateNavigationController
    private func templateNavigationController(titleText: String, unselectedImage: UIImage, selectImage: UIImage, rootViewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectImage
        nav.navigationBar.tintColor = .black
        nav.title = titleText
        return nav
    }
}

extension MainTabBarController: UITabBarControllerDelegate{
    
}
