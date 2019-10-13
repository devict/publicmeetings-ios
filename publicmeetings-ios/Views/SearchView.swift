//
//  SearchView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/13/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class SearchView: UIView {

    //MARK: - Properties
    var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchBarStyle = .prominent
        search.placeholder = "Enter search terms"
        return search
    }()
    
    var detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
       [searchBar, detailView].forEach { addSubview($0) }
    }
     
    private func setupLayout() {
        NSLayoutConstraint.activate([
           searchBar.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.0),
           searchBar.widthAnchor.constraint(equalToConstant: Screen.width),
           detailView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
           detailView.widthAnchor.constraint(equalToConstant: Screen.width),
           detailView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
