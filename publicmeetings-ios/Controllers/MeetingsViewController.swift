//
//  MeetingsViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/5/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit
import MapKit

class MeetingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    var venue: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["All", "Wichita", "County", "State"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = UIColor(named: "softBlue")
        segmented.selectedSegmentIndex = 0
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        segmented.layer.borderColor = UIColor.white.cgColor
        segmented.layer.borderWidth = 0.9
        return segmented
    }()
    
    var noMeetingView: UIView = {
        let view = NoMeetingsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.backgroundColor = UIColor(named: "devictTan")
        return view
    }()
    
    var tableView = UITableView()
    
    var allMeetings = [Meeting]()
    var meetings = [Meeting]()
    
    //MARK: - ViewController Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.items?[0].badgeColor = UIColor(named: "softRed")
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
        navigationController?.navigationBar.barTintColor = UIColor(named: "devictBlue")
    }
    
    //MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MeetingCell
        let row = indexPath.row
        
        let actualDate = convertToDate(stringDate: meetings[row].date)
        
        cell.badgeDelegate = self
        cell.name.text = meetings[row].title
        cell.desc.text = meetings[row].description
        cell.address.text = meetings[row].address
        cell.location.text = meetings[row].location
        cell.city.text = meetings[row].cityState
        
        cell.dateView.dayOfWeekLabel.text = actualDate.longDay
        cell.dateView.dateLabel.text = actualDate.dateOfMonth
        cell.dateView.monthLabel.text = actualDate.longMonth

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meetingAddress = meetings[indexPath.row].mappableAddress
        
        coordinates(forAddress: meetingAddress) {
            (location) in
            guard let location = location else {
                //FIXME: Handle error here.
                return
            }
            
            self.openMapForPlace(lat: location.latitude, long: location.longitude)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Meetings"
        }
    }
    
    private func setupView() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        
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
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            venue.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 0.0),
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
            for meeting in allMeetings where meeting.venue == venue {
                meetings.append(meeting)
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

extension MeetingsViewController {
    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard error == nil else {
                //FIXME: Handle error properly
                print("Geocoding error: \(error!)")
                completion(nil)
                return
            }
            
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
    public func openMapForPlace(lat: Double = 0, long: Double = 0, placeName: String = "") {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long

        let regionDistance: CLLocationDistance = 100
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "City Hall"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    //NOTE: THIS IS A FAKE METHOD FOR TESTING ONLY!!!  DO NOT USE IN PRODUCTION CODE!!!
    func convertToDate(stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let date = dateFormatter.date(from: stringDate)!
        return date
    }
}
