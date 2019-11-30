//
//  DocumentsView.swift
//  publicmeetings-ios
//
//  Created by mpc on 11/21/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class DocumentsView: UIView, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    var docType: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Agendas", "Minutes"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = UIColor.black
        segmented.selectedSegmentIndex = 0
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        segmented.layer.borderColor = UIColor.white.cgColor
        segmented.layer.borderWidth = 0.9
        return segmented
    }()
    
    var allMeetings = [Meeting]()
    var tableView = UITableView()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        
        allMeetings = meetingData()
        print("allMeetings: \(allMeetings)")
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - TableView delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allMeetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "minutesCell") as! MinutesCell
        let row = indexPath.row
        
        cell.name.text = allMeetings[row].title
        cell.desc.text = allMeetings[row].description
        cell.meetingDate.text = allMeetings[row].date
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = "http://wichitaks.granicus.com/MinutesViewer.php?view_id=2&clip_id=3883"
        
        let viewController = WebViewer()
        viewController.documentUrl = url
        
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(viewController, animated: true, completion: nil)
        }
    }
    
    
    //MARK: - Setup and Layout
    private func setupView() {
        [docType, tableView].forEach { addSubview($0) }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MinutesCell.self, forCellReuseIdentifier: "minutesCell")
    }
    
    private func setupLayout() {
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            docType.topAnchor.constraint(equalTo: topAnchor),
            docType.leadingAnchor.constraint(equalTo: leadingAnchor),
            docType.trailingAnchor.constraint(equalTo: trailingAnchor),
            docType.heightAnchor.constraint(equalToConstant: 31.0),
            
            tableView.topAnchor.constraint(equalTo: docType.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupActions() {
        
    }
}
