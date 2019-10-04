//
//  MeetingsView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/2/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MeetingsView: UIView, UISearchBarDelegate {

    //MARK: - Properties
    var meetingLocality: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Wichita","County", "State"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = .clear
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
        addSubview(meetingLocality)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            meetingLocality.topAnchor.constraint(equalTo: topAnchor),
            meetingLocality.leadingAnchor.constraint(equalTo: leadingAnchor),
            meetingLocality.trailingAnchor.constraint(equalTo: trailingAnchor),
            meetingLocality.heightAnchor.constraint(equalToConstant: 30.0)
        ])
    }
}
