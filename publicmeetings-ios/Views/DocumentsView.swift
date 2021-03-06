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
    var allMeetings = [Meeting]()
    var tableView = UITableView()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        
        allMeetings = meetingData()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - TableView delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allMeetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentsCell") as! DocumentsCell
        let row = indexPath.row
        
        cell.name.text = allMeetings[row].title
        cell.desc.text = allMeetings[row].description
        cell.meetingDate.text = allMeetings[row].date
        cell.minutesUrl = allMeetings[row].minutesUrl
        cell.agendaUrl = allMeetings[row].agendaUrl
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(DocumentsCell.self, forCellReuseIdentifier: "documentsCell")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
