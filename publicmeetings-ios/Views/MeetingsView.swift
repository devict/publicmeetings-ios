//
//  MeetingsView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/2/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MeetingsView: UIView {

    //MARK: - Properties
    var meetingLocation: UISegmentedControl = {
           let segmented = UISegmentedControl(items: ["Wichita","County", "State"])
           segmented.translatesAutoresizingMaskIntoConstraints = false
           segmented.backgroundColor = .clear
           segmented.tintColor = .systemOrange
           segmented.selectedSegmentIndex = 0
           return segmented
    }()

    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        setupView()
        setupLayout()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        addSubview(meetingLocation)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            meetingLocation.topAnchor.constraint(equalTo: topAnchor),
            meetingLocation.leadingAnchor.constraint(equalTo: leadingAnchor),
            meetingLocation.trailingAnchor.constraint(equalTo: trailingAnchor),
            meetingLocation.heightAnchor.constraint(equalToConstant: 30.0)
        ])
    }
}
