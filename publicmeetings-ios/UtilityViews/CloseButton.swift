//
//  CloseButton.swift
//  Faith
//
//  Created by mpc on 1/5/20.
//  Copyright © 2020 mpc. All rights reserved.
//

import UIKit

protocol CloseButtonDelegate: class {
    func closeButtonTapped()
}

class CloseButton: UIButton {

    weak var delegate: CloseButtonDelegate?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupActions()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup
    func setupView() {
        self.setImage(UIImage(systemName: "xmark"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupActions() {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func buttonTapped() {
        delegate?.closeButtonTapped()
    }
}
