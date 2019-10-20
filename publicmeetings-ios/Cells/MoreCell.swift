//
//  MoreCell.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/5/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MoreCell: UITableViewCell {

    //MARK: - Properties
    var item: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.font
        return label
    }()
    
    var version: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .black
        label.isHidden = true
        label.font = Standard.font
        return label
    }()
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [item, version].forEach { contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            item.centerYAnchor.constraint(equalTo: centerYAnchor),
            item.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            item.widthAnchor.constraint(equalToConstant: 200.0),
            item.heightAnchor.constraint(equalToConstant: 35.0),
            
            version.centerYAnchor.constraint(equalTo: centerYAnchor),
            version.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
            version.widthAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Cell delegates
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
