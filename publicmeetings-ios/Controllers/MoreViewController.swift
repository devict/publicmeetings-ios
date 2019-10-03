//
//  MoreViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/2/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        setScreenTitle()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "More"
        }
    }
    
}
