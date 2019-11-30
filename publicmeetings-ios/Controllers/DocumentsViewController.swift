//
//  DocumentsViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 11/21/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController {

    var documentsView: DocumentsView = {
        let view = DocumentsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "devictTan")
        
        setupView()
        setupLayout()
        setScreenTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setScreenTitle()
        navigationController?.navigationBar.barTintColor = .systemPurple
    }
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Documents"
        }
    }
    
    private func setupView() {
        view.addSubview(documentsView)
    }
    
    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            documentsView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0.0),
            documentsView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            documentsView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            documentsView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}
