//
//  SearchViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/13/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var searchView: SearchView = {
        let view = SearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
        navigationController?.navigationBar.barTintColor = UIColor(named: "devictBlue")
    }
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Search"
        }
    }
    
    private func setupView() {
        view.addSubview(searchView)
        navigationController?.navigationBar.barTintColor = .systemRed
    }
    
    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 0.0),
            searchView.widthAnchor.constraint(equalToConstant: Screen.width),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
