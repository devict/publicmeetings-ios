//
//  MinutesCell.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/6/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MinutesCell: UITableViewCell {

    var minutes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        setupView()
        setupLayout()
        
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.cornerRadius = 12.0
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowColor = UIColor.black.cgColor

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        contentView.addSubview(minutes)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            minutes.centerYAnchor.constraint(equalTo: centerYAnchor),
            minutes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            minutes.widthAnchor.constraint(equalToConstant: 200.0),
            minutes.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }
}
