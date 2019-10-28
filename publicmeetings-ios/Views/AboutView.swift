//
//  AboutView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/28/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class AboutView: UIView {
    
    var about: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "About information"
        label.font = Standard.largeFont
        label.textAlignment = .center
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
        addSubview(about)
        backgroundColor = UIColor(named: "devictTan")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: topAnchor),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            
            about.centerYAnchor.constraint(equalTo: centerYAnchor),
            about.centerYAnchor.constraint(equalTo: centerYAnchor),
            about.widthAnchor.constraint(equalToConstant: Screen.width),
            about.heightAnchor.constraint(equalToConstant: 60.0),
        ])
    }
}
