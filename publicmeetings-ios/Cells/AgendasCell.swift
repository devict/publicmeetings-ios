//
//  MinutesCell.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/6/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class AgendasCell: UITableViewCell {

    var view: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.black.cgColor
        v.layer.borderWidth = 0.3
        v.clipsToBounds = true
        return v
    }()
    
    var agendas: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = Standard.font
        return label
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        [view, agendas].forEach { contentView.addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 3.0),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3.0),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3.0),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3.0),
            
            agendas.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            agendas.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            agendas.widthAnchor.constraint(equalToConstant: 200.0),
            agendas.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }
}
