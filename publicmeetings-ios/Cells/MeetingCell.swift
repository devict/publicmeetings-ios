//
//  MeetingCell.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/4/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MeetingCell: UITableViewCell {

    //MARK: - Properties
    var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var reminder: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal)
        button.tintColor = UIColor(named: "devictBlue")
        return button
    }()
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Cell delegates
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        contentView.addSubview(name)
        contentView.addSubview(reminder)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            name.centerYAnchor.constraint(equalTo: centerYAnchor),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            name.widthAnchor.constraint(equalToConstant: 200.0),
            name.heightAnchor.constraint(equalToConstant: 35.0),
            
            reminder.centerYAnchor.constraint(equalTo: centerYAnchor),
            reminder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
            reminder.widthAnchor.constraint(equalToConstant: 20.0),
            reminder.heightAnchor.constraint(equalToConstant: 20.0)
        ])
    }
}
