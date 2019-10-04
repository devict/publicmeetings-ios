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

        let meetingsViewController = MeetingsViewController()
        let moreViewController = MoreViewController()
         
        let config = UIImage.SymbolConfiguration(weight: .heavy)
        let meetingImage = UIImage(systemName: "calendar", withConfiguration: config)
        let moreImage = UIImage(systemName: "ellipsis.circle", withConfiguration: config)
        
        meetingsViewController.tabBarItem = UITabBarItem(title: "Meetings", image: meetingImage, selectedImage: meetingImage)
        moreViewController.tabBarItem = UITabBarItem(title: "More", image: moreImage, selectedImage: moreImage)
        
        meetingsViewController.navigationController?.navigationBar.topItem?.title = "Meetings"
        moreViewController.navigationController?.navigationBar.topItem?.title = "More"
         
        let viewControllerList = [meetingsViewController, moreViewController]
        viewControllers = viewControllerList
        
        UITabBar.appearance().tintColor = UIColor(named: "devictOrange")
        UITabBar.appearance().unselectedItemTintColor = .black
    }
}
