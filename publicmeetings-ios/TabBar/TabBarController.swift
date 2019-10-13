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
        let minutesViewController = MinutesViewController()
        let searchViewController = SearchViewController()
        let moreViewController = MoreViewController()
         
        //MARK: - TabBar image setup
        let config = UIImage.SymbolConfiguration(weight: .heavy)
        let meetingImage = UIImage(systemName: "calendar", withConfiguration: config)
        let minutesImage = UIImage(systemName: "clock", withConfiguration: config)
        let searchImage = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        let moreImage = UIImage(systemName: "ellipsis.circle", withConfiguration: config)
        
        //MARK: - TabBar item setup
        meetingsViewController.tabBarItem = UITabBarItem(title: "Meetings", image: meetingImage, selectedImage: meetingImage)
        minutesViewController.tabBarItem = UITabBarItem(title: "Minutes", image: minutesImage, selectedImage: minutesImage)
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: searchImage, selectedImage: searchImage)
        moreViewController.tabBarItem = UITabBarItem(title: "More", image: moreImage, selectedImage: moreImage)
        
        //MARK: - Navigation
        meetingsViewController.navigationController?.navigationBar.topItem?.title = "Meetings"
        minutesViewController.navigationController?.navigationBar.topItem?.title = "Minutes"
        searchViewController.navigationController?.navigationBar.topItem?.title = "Search"
        moreViewController.navigationController?.navigationBar.topItem?.title = "More"
         
        //MARK: - ViewController configuration
        let viewControllerList = [meetingsViewController, minutesViewController, searchViewController, moreViewController]
        viewControllers = viewControllerList
        
        //MARK: - TabBar configuration
        UITabBar.appearance().tintColor = UIColor(named: "devictOrange")
        UITabBar.appearance().unselectedItemTintColor = .black
    }
}

