//
//  AboutViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/28/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, CloseButtonDelegate {

    var aboutView: AboutView = {
        let view = AboutView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var closeButton: CloseButton = {
        let button = CloseButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
    
   
    //MARK: - Setup and Layout
    private func setupView() {
        [aboutView, closeButton].forEach { view.addSubview($0) }
        
        closeButton.delegate = self
        closeButton.tintColor = .white
    }
    
    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            aboutView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 0.0),
            aboutView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aboutView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 3.0),
            closeButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 3.0),
            closeButton.widthAnchor.constraint(equalToConstant: 50.0),
            closeButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    //MARK: - Actions
    func closeButtonTapped() {
        print("view.closeButtonTapped")
        self.dismiss(animated: true, completion: nil)
    }
}
