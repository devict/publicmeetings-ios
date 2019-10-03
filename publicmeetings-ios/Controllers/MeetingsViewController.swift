//
//  MeetingsViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/2/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MeetingsViewController: UIViewController {

    //MARK: - Properties
    var meetingsView: MeetingsView = {
        let view = MeetingsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "devictOrange")
        return view
    }()
        
    //MARK: - Delegates
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "devictTan")
        setScreenTitle()
        
        setupView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    //MARK: - Methods
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
