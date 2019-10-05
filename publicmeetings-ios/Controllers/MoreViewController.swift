//
//  MoreViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/2/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    let moreItems: [String] = ["About","Libraries","Version"]

    var tableView = UITableView()
    
    
    //MARK: - ViewController Delegates
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        
        setupView()
        setupLayout()
        setScreenTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    //MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell") as! MoreCell
        let row = indexPath.row
        
        cell.item.text = moreItems[row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "More"
        }
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MoreCell.self, forCellReuseIdentifier: "moreCell")
        tableView.tableFooterView = UIView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
