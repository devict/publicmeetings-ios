//
//  DocumentsCell.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/6/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class DocumentsCell: UITableViewCell {

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
    
    var minutesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Minutes", for: .normal)
        button.titleLabel?.font = Standard.systemFont
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.9
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12.0
        return button
    }()
    
    var agendaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Agenda", for: .normal)
        button.titleLabel?.font = Standard.systemFont
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.9
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12.0
        return button
    }()
    
    
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        setupView()
        setupLayout()
        setupActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        [view, name, desc, meetingDate, minutesButton, agendaButton].forEach { contentView.addSubview($0) }
        
        selectionStyle = .none
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
            
            minutesButton.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 10.0),
            minutesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            minutesButton.widthAnchor.constraint(equalToConstant: 120.0),
            minutesButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            agendaButton.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 10.0),
            agendaButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0),
            agendaButton.widthAnchor.constraint(equalToConstant: 120.0),
            agendaButton.heightAnchor.constraint(equalToConstant: 40.0)            
        ])
    }
    
    func setupActions() {
        minutesButton.addTarget(self, action: #selector(minutesButtonTapped(sender:)), for: .touchUpInside)
        agendaButton.addTarget(self, action: #selector(agendaButtonTapped(sender:)), for: .touchUpInside)
    }
    
    
    //MARK: - Actions
    @objc func minutesButtonTapped(sender: UIButton) {
        print("minutesButtonTapped")
    }
    
    @objc func agendaButtonTapped(sender: UIButton) {
        print("agendaButtonTapped")
    }    
}
