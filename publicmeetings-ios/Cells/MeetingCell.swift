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
    var view: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.black.cgColor
        v.layer.borderWidth = 0.3
        v.clipsToBounds = true
        return v
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.fontBold
        label.baselineAdjustment = .alignCenters
        return label
    }()
    
    var desc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.font
        return label
    }()
    
    var meetingDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Damascus", size: 13.0)
        return label
    }()
    
    var address: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.font
        label.text = ""
        return label
    }()
    
    var location: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.font
        return label
    }()
    
    var city: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.font
        label.text = ""
        return label
    }()
    
    var state: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.font
        label.text = ""
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //MARK: - Cell delegates
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        [view, name, desc, meetingDate, address, location, city, reminder, share].forEach { contentView.addSubview($0) }
        backgroundColor = .clear
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 3.0),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3.0),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3.0),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3.0),
            
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 10.0),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            name.widthAnchor.constraint(equalToConstant: 200.0),
            name.heightAnchor.constraint(equalToConstant: 22.0),
            
            meetingDate.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            meetingDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13.0),
            meetingDate.widthAnchor.constraint(equalToConstant: 70.0),
            meetingDate.heightAnchor.constraint(equalToConstant: 20.0),
            
            desc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 6.0),
            desc.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            desc.widthAnchor.constraint(equalToConstant: 200.0),
            desc.heightAnchor.constraint(equalToConstant: 20.0),
            
            address.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 2.0),
            address.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            address.widthAnchor.constraint(equalToConstant: 200.0),
            address.heightAnchor.constraint(equalToConstant: 20.0),
            
            location.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 2.0),
            location.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            location.widthAnchor.constraint(equalToConstant: 200.0),
            location.heightAnchor.constraint(equalToConstant: 20.0),
            
            city.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 2.0),
            city.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            city.widthAnchor.constraint(equalToConstant: 200.0),
            city.heightAnchor.constraint(equalToConstant: 22.0),
            
            reminder.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0),
            reminder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0),
            reminder.widthAnchor.constraint(equalToConstant: 40.0),
            reminder.heightAnchor.constraint(equalToConstant: 40.0),
            
            share.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0),
            share.trailingAnchor.constraint(equalTo: reminder.leadingAnchor, constant: -5.0),
            share.widthAnchor.constraint(equalToConstant: 40.0),
            share.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupActions() {
        reminder.addTarget(self, action: #selector(reminderTapped(sender:)), for: .touchUpInside)
        share.addTarget(self, action: #selector(shareTapped(sender:)), for: .touchUpInside)
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
