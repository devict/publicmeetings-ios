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
    let options: [String] = ["Voter Registration", "About", "Version"]
    
    var tableView = UITableView()
    
    var version: String = {
        let ver: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        return ver
    }()
    
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
        navigationController?.navigationBar.barTintColor = .systemYellow
    }
    
    //MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell") as! MoreCell
        let row = indexPath.row
        
        cell.item.text = options[row]
        cell.version.text = version
        
        guard let itemText = cell.item.text else { return cell }
        cell.version.isHidden = itemText != "Version"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as! MoreCell
        
        if let currentItem = currentCell.item.text {
            if currentItem == "Voter Registration" {
                let url = "http://www.voteks.org/before-you-vote/how-do-i-register.html"
                        
                let viewController = WebViewer()
                viewController.documentUrl = url
                
                DispatchQueue.main.async {
                    self.present(viewController, animated: true, completion: nil)
                }
            }
            
            if currentItem == "About" {
                let viewController = AboutViewController()
                
                DispatchQueue.main.async {
                    self.present(viewController, animated: true, completion: nil)
                }
            }
        }
    }
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "More"
        }
    }
    
    private func setupView() {
        navigationController?.navigationBar.barTintColor = .systemYellow
        
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
            tableView.widthAnchor.constraint(equalToConstant: Screen.width),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
