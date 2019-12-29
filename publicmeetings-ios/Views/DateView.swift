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
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        [dayOfWeekLabel, dateLabel, monthLabel].forEach { addSubview($0) }
        
        backgroundColor = UIColor(named: "softRed")
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}
