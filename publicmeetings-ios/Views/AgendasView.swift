//
//  AgendasView.swift
//  publicmeetings-ios
//
//  Created by mpc on 11/21/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class AgendasView: UIView {

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        setupActions()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {

    }
    
    private func setupLayout() {
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
        
        ])
    }
    
    private func setupActions() {
        
    }

}
