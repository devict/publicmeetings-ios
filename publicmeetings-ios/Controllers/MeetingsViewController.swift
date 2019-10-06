//
//  MeetingsViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/5/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MeetingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    var meetingLocality: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Wichita", "County", "State"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = UIColor(named: "papayaWhip")
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    var tableView = UITableView()
    
    var names: [String] = ["Zeroth","First","Second","Third","Fourth","Fifth","Sixth","Seventh","Eighth","Ninth","Tenth","Eleventh","Twelvth","Thirteenth","Fourteenth","Fifteenth","Sixteenth","Seventeenth","Eighteenth","Nineteenth"]
    
    //MARK: - ViewController Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Temporary - Proof of concept only
        tabBarController?.tabBar.items?[0].badgeColor = UIColor(named: "devictBlue")
        tabBarController?.tabBar.items?[0].badgeValue = "3"

        setupView()
        setupLayout()
        setScreenTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    //MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MeetingCell
        let row = indexPath.row
        let backColor: UIColor = row % 2 == 0 ? .white : .systemGray6
        
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = backColor
        cell.name.text = names[row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = names[indexPath.row]
        let viewController = MeetingsDetailViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
        
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Meetings"
        }
    }
    
    private func setupView() {
        view.addSubview(meetingLocality)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MeetingCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            meetingLocality.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 11.0),
            meetingLocality.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            meetingLocality.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            meetingLocality.heightAnchor.constraint(equalToConstant: 30.0),
            
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: meetingLocality.bottomAnchor, multiplier: 0.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
