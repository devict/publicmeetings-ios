//
//  AboutView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/28/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class AboutView: UIView {
    
    var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "devict-icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var developedBy: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Developed By"
        label.font = Standard.systemFont
        label.textAlignment = .center
        return label
    }()
    
    var developers: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Michael Campbell"
        label.font = Standard.systemFont
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
        [logo, developedBy, developers].forEach { addSubview($0) }
        backgroundColor = UIColor(named: "devictTan")
    }
    
    private func setupLayout() {
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 30.0),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: Screen.width * 0.65),
            
            developedBy.topAnchor.constraint(equalTo: bottomAnchor, constant: -70.0),
            developedBy.centerXAnchor.constraint(equalTo: centerXAnchor),
            developedBy.widthAnchor.constraint(equalToConstant: Screen.width),
            developedBy.heightAnchor.constraint(equalToConstant: 20.0),
            
            developers.topAnchor.constraint(equalTo: bottomAnchor, constant: -50.0),
            developers.centerXAnchor.constraint(equalTo: centerXAnchor),
            developers.widthAnchor.constraint(equalToConstant: Screen.width),
            developers.heightAnchor.constraint(equalToConstant: 20.0),
        ])
    }
}
