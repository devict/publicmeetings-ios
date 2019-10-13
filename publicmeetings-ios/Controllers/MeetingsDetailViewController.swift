//
//  MeetingsDetailViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/6/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MeetingsDetailViewController: UIViewController {

    var meetingsDetail: MeetingsDetailView = {
        var map = MeetingsDetailView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupView()
        setupLayout()
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        view.addSubview(meetingsDetail)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            meetingsDetail.topAnchor.constraint(equalTo: view.topAnchor),
            meetingsDetail.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            meetingsDetail.widthAnchor.constraint(equalToConstant: Screen.width)
        ])
    }
}
