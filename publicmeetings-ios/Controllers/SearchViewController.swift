//
//  SearchViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/13/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Search"
        }
    }
    
    private func setupView() {
        
    }
    
    private func setupLayout() {
        
    }
    
    private func setupActions() {
        
    }
}
