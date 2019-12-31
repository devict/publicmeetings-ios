//
//  AboutViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/28/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var aboutView: AboutView = {
        let view = AboutView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
    
   
    //MARK: - Setup and Layout
    private func setupView() {
        view.addSubview(aboutView)
    }
    
    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            aboutView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 0.0),
            aboutView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aboutView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
