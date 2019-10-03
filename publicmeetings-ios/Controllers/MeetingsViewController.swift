//
//  MeetingsViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/2/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MeetingsViewController: UIViewController {

    var meetingsView: MeetingsView = {
        let view = MeetingsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemOrange
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray3
        setScreenTitle()
        
        setupView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Meetings"
        }
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        view.addSubview(meetingsView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            meetingsView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 11.0),
            meetingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            meetingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            meetingsView.heightAnchor.constraint(equalToConstant: 30.0)
        ])
    }
}
