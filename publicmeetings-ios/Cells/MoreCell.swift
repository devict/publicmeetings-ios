//
//  MoreCell.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/5/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MoreCell: UITableViewCell {

    var item: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(item)
        
        NSLayoutConstraint.activate([
            item.centerYAnchor.constraint(equalTo: centerYAnchor),
            item.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            item.widthAnchor.constraint(equalToConstant: 200.0),
            item.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
