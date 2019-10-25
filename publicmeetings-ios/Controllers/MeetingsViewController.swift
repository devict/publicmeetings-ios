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
    var venue: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["All", "Wichita", "County", "State"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = UIColor(named: "devictBlue")
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    var noMeetingView: UIView = {
        let view = NoMeetingsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
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
        return meetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MeetingCell
        let row = indexPath.row
        
        cell.badgeDelegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.name.text = meetings[row].title
        cell.desc.text = meetings[row].description
        cell.address.text = meetings[row].address
        cell.location.text = meetings[row].location
        cell.city.text = meetings[row].city
        cell.meetingDate.text = meetings[row].date

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = meetings[indexPath.row]
        let viewController = MeetingsDetailViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Meetings"
        }
    }
    
    private func setupView() {
        [venue, noMeetingView, tableView].forEach { view.addSubview($0) }
        
        view.backgroundColor = UIColor(named: "devictTan")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MeetingCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            venue.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 11.0),
            venue.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            venue.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            venue.heightAnchor.constraint(equalToConstant: 30.0),
            
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: venue.bottomAnchor, multiplier: 1.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupActions() {
        venue.addTarget(self, action: #selector(segmentedValueChanged(sender:)), for: .valueChanged)
    }
    
    //MARK: - Actions
    @objc func segmentedValueChanged(sender: UISegmentedControl) {
        noMeetingView.isHidden = true
        
        guard let venue = sender.titleForSegment(at: sender.selectedSegmentIndex) else { return }
          
        meetings = []
        
        if venue == "All" {
            meetings = allMeetings
        } else {
            for meeting in allMeetings {
                if meeting.venue == venue {
                    meetings.append(meeting)
                }
            }

            if meetings.count == 0 {
                NSLayoutConstraint.activate([
                    noMeetingView.topAnchor.constraint(equalTo: self.venue.bottomAnchor, constant: 1.0),
                    noMeetingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    noMeetingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    noMeetingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
                
                noMeetingView.isHidden = false
            } else {
                noMeetingView.isHidden = true
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
