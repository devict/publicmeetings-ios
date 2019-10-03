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
         
         meetingsViewController.tabBarItem = UITabBarItem(title: "Meetings", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
         moreViewController.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        
         meetingsViewController.navigationController?.navigationBar.topItem?.title = "Meetings"
         moreViewController.navigationController?.navigationBar.topItem?.title = "More"
         
         let viewControllerList = [meetingsViewController, moreViewController]
         viewControllers = viewControllerList
    }
}
