//
//  DateView.swift
//  publicmeetings-ios
//
//  Created by mpc on 12/28/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class DateView: UIView {

    var dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Standard.systemFont
        label.textAlignment = .center
        label.text = "Monday"
        label.textColor = .white
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Standard.systemFontLarge
        label.textAlignment = .center
        label.text = "30"
        label.textColor = .white
        return label
    }()
    
    var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Standard.systemFont
        label.textAlignment = .center
        label.text = "January"
        label.textColor = .white
        return label
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        //setupLayout()
        //setupActions()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        [dayOfWeekLabel, dateLabel, monthLabel].forEach { addSubview($0) }
        backgroundColor = UIColor(named: "softRed")
    }
    
    private func setupLayout() {
        print("---> self.layer.frame.height: \(self.layer.frame.height)")
        print("---> self.frame.height: \(self.frame.height)")
        
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor),
            dayOfWeekLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayOfWeekLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dayOfWeekLabel.heightAnchor.constraint(equalToConstant: self.layer.frame.height * 0.5),
            
            dateLabel.topAnchor.constraint(equalTo: dayOfWeekLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 60.0),
                   
            monthLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupActions() {
        
    }
}
