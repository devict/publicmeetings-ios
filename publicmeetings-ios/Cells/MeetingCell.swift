//
//  MeetingCell.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/4/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

protocol BadgeDelegate: class {
    func incrementBadgeValue(item: Int)
    func decrementBadgeValue(item: Int)
}

class MeetingCell: UITableViewCell {

    //MARK: - Properties
    var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var desc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var meetingDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "AvenirNext-Regular", size: 10.0)
        label.textAlignment = .right
        return label
    }()
    
    var reminder: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    var share: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    weak var badgeDelegate: BadgeDelegate?
    
    var meetingAdded: Bool = false
    var badgeCount: Int = 0
    
    var tabBarController = TabBarController()
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupLayout()
        setupActions()
        setupShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Cell delegates
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        [name, desc, meetingDate, reminder, share].forEach { contentView.addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 3.0),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            name.widthAnchor.constraint(equalToConstant: 200.0),
            name.heightAnchor.constraint(equalToConstant: 35.0),
            
            meetingDate.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            meetingDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25.0),
            meetingDate.widthAnchor.constraint(equalToConstant: 70.0),
            
            desc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 2.0),
            desc.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            desc.widthAnchor.constraint(equalToConstant: 300.0),
            desc.heightAnchor.constraint(equalToConstant: 35.0),
            
            reminder.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0),
            reminder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
            reminder.widthAnchor.constraint(equalToConstant: 40.0),
            reminder.heightAnchor.constraint(equalToConstant: 40.0),
            
            share.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0),
            share.trailingAnchor.constraint(equalTo: reminder.leadingAnchor, constant: -10.0),
            share.widthAnchor.constraint(equalToConstant: 40.0),
            share.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupActions() {
        reminder.addTarget(self, action: #selector(reminderTapped(sender:)), for: .touchUpInside)
        share.addTarget(self, action: #selector(shareTapped(sender:)), for: .touchUpInside)
    }
    
    private func setupShadow() {
        backgroundColor = .clear
        
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.cornerRadius = 12.0
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowColor = UIColor.black.cgColor

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12.0
    }
        
    //MARK: - Actions
    @objc func reminderTapped(sender: UIButton) {
        meetingAdded = !meetingAdded
        
        if meetingAdded {
            sender.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal)
            badgeDelegate?.incrementBadgeValue(item: 0)
        } else {
            sender.setImage(UIImage(systemName: "calendar"), for: .normal)
            badgeDelegate?.decrementBadgeValue(item: 0)
        }
    }
    
    @objc func shareTapped(sender: UIButton) {
        print("shareTapped")
    }
}


