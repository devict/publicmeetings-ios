//
//  TabBarController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/2/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Properties
        let meetingsViewController = MeetingsViewController()
        let documentsViewController = DocumentsViewController()
        let searchViewController = SearchViewController()
        let moreViewController = MoreViewController()
         
        //MARK: - TabBar image setup
        let config = UIImage.SymbolConfiguration(weight: .heavy)
        let meetingImage = UIImage(systemName: "calendar", withConfiguration: config)
        let documentsImage = UIImage(systemName: "doc.plaintext", withConfiguration: config)
        let searchImage = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        let moreImage = UIImage(systemName: "ellipsis.circle", withConfiguration: config)
        
        //MARK: - TabBar item setup
        meetingsViewController.tabBarItem = UITabBarItem(title: "Meetings", image: meetingImage, selectedImage: meetingImage)
        documentsViewController.tabBarItem = UITabBarItem(title: "Documents", image: documentsImage, selectedImage: documentsImage)
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: searchImage, selectedImage: searchImage)
        moreViewController.tabBarItem = UITabBarItem(title: "More", image: moreImage, selectedImage: moreImage)
        
        //MARK: - Navigation
        meetingsViewController.navigationController?.navigationBar.topItem?.title = "Meetings"
        documentsViewController.navigationController?.navigationBar.topItem?.title = "Documents"
        searchViewController.navigationController?.navigationBar.topItem?.title = "Search"
        moreViewController.navigationController?.navigationBar.topItem?.title = "More"
         
        //MARK: - ViewController configuration
        let viewControllerList = [meetingsViewController, documentsViewController, searchViewController, moreViewController]
        viewControllers = viewControllerList
        
        
        //MARK: - TabBar configuration
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "unselectedBlue")
        UITabBar.appearance().alpha = 1.0
        UITabBar.appearance().backgroundColor = UIColor(named: "devictBlue")
    }
}

