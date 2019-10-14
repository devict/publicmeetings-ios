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
        let segmented = UISegmentedControl(items: ["All", "Wichita", "County", "State"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = UIColor(named: "papayaWhip")
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    var tableView = UITableView()
    
    var allMeetings = [Meeting]()
    var meetings = [Meeting]()
    
    var names: [String] = ["Zeroth","First","Second","Third","Fourth","Fifth","Sixth","Seventh","Eighth","Ninth","Tenth","Eleventh","Twelvth","Thirteenth","Fourteenth","Fifteenth","Sixteenth","Seventeenth","Eighteenth","Nineteenth"]
    
    //MARK: - ViewController Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.items?[0].badgeColor = UIColor(named: "devictBlue")
        tabBarController?.tabBar.items?[0].badgeValue = nil

        allMeetings = meetingData()
        meetings = allMeetings
        
        setupView()
        setupLayout()
        setupActions()
        setScreenTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    //MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MeetingCell
        let row = indexPath.row
        let backColor: UIColor = row % 2 == 0 ? .white : .systemGray6
        
        cell.badgeDelegate = self
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = backColor
        cell.name.text = meetings[row].title
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
        [meetingLocality, tableView].forEach { view.addSubview($0) }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MeetingCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            meetingLocality.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 11.0),
            meetingLocality.widthAnchor.constraint(equalToConstant: Screen.width),
            meetingLocality.heightAnchor.constraint(equalToConstant: 30.0),
            
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: meetingLocality.bottomAnchor, multiplier: 0.0),
            tableView.widthAnchor.constraint(equalToConstant: Screen.width),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupActions() {
        meetingLocality.addTarget(self, action: #selector(segmentedValueChanged(sender:)), for: .valueChanged)
    }
    
    //MARK: - Actions
    @objc func segmentedValueChanged(sender: UISegmentedControl) {
        guard let location = sender.titleForSegment(at: sender.selectedSegmentIndex) else { return }
          
        meetings = []
        
        if location == "All" {
            meetings = allMeetings
        } else {
            for meeting in allMeetings {
                if meeting.location == location {
                    meetings.append(meeting)
                }
            }
        }

        tableView.reloadData()
    }
}

extension MeetingsViewController: BadgeDelegate {
    /** Increment the badgeValue for the tabBar items
     
    - Parameter item: The index of the tabBar of the item with the badge.
    */
    
    func incrementBadgeValue(item: Int) {
        var currentValue: Int = 0
        
        if tabBarController?.tabBar.items![item].badgeValue == "" {
            currentValue = 0
        } else {
            if let cv = Int(tabBarController?.tabBar.items![item].badgeValue ?? "0") {
                currentValue = cv
            }
        }
        
        if tabBarController?.tabBar.items![item].badgeValue == nil { currentValue = 0 }
        tabBarController?.tabBar.items![item].badgeValue = String(currentValue + 1)
    }
    
    /** Decrement the badgeValue for the tabBar items.   If the badgeValue  gets to zero, the badge will be set to nil and not displayed
     
    - Parameter item: The index of the tabBar of the item with the badge.
    */
    
    func decrementBadgeValue(item: Int) {
        guard let currentBadgeValue = tabBarController?.tabBar.items![item].badgeValue else { return }
        let currentValue: Int = Int(currentBadgeValue) ?? 0
        
        //Catch unusual badge value
        if currentValue == 0 {
             tabBarController?.tabBar.items![item].badgeValue = nil
             return
         }
        
        tabBarController?.tabBar.items![item].badgeValue = String(currentValue - 1)
        
        if tabBarController?.tabBar.items![item].badgeValue == "0" {
            tabBarController?.tabBar.items![item].badgeValue = nil
        }
    }
}
