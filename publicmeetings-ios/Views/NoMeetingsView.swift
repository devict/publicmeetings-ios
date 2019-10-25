//
//  NoMeetingsView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/25/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class NoMeetingsView: UIView {

    var noMeetings: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = Standard.largeFont
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "No scheduled meetings"
        return label
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
        addSubview(noMeetings)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            noMeetings.centerXAnchor.constraint(equalTo: centerXAnchor),
            noMeetings.centerYAnchor.constraint(equalTo: centerYAnchor),
            noMeetings.widthAnchor.constraint(equalToConstant: Screen.width),
            noMeetings.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
}
