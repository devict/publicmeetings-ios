//
//  LoginView.swift
//  publicmeetings-ios
//
//  Created by mpc on 1/10/20.
//  Copyright © 2020 mpc. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginView: UIView {

    var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "meetingroom"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()

    var username: UITextField = {
        let text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.placeholder = "Enter username"
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 0.6
        text.autocapitalizationType = .none
        return text
    }()

    var password: UITextField = {
        let text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.placeholder = "Enter password"
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 0.6
        text.autocapitalizationType = .none
        return text
    }()

    var forgotPassword: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot password", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.6
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    var register: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.6
        button.setTitleColor(.black, for: .normal)
        return button
    }()

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

    override func layoutSubviews() {
        username.layer.cornerRadius = Standard.appleRadius
        password.layer.cornerRadius = Standard.appleRadius
        register.layer.cornerRadius = Standard.appleRadius
        forgotPassword.layer.cornerRadius = Standard.appleRadius
    }

    //MARK: - Setup and Layout
    private func setupView() {
        [imageView, username, password, forgotPassword, register].forEach { addSubview($0) }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            username.topAnchor.constraint(equalTo: topAnchor, constant: 155.0),
            username.centerXAnchor.constraint(equalTo: centerXAnchor),
            username.widthAnchor.constraint(equalToConstant: 160.0),
            username.heightAnchor.constraint(equalToConstant: 35.0),

            password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10.0),
            password.centerXAnchor.constraint(equalTo: centerXAnchor),
            password.widthAnchor.constraint(equalToConstant: 160.0),
            password.heightAnchor.constraint(equalToConstant: 35.0),

            register.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 40.0),
            register.centerXAnchor.constraint(equalTo: centerXAnchor),
            register.widthAnchor.constraint(equalToConstant: 160.0),
            register.heightAnchor.constraint(equalToConstant: 35.0),

            forgotPassword.topAnchor.constraint(equalTo: register.bottomAnchor, constant: 10.0),
            forgotPassword.centerXAnchor.constraint(equalTo: centerXAnchor),
            forgotPassword.widthAnchor.constraint(equalToConstant: 160.0),
            forgotPassword.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }

    private func setupActions() {
        register.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        forgotPassword.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
    }


    @objc func registerTapped() {
        print("registerTapped")
    }

    @objc func forgetPasswordTapped() {
        print("forgetPasswordTapped")
    }
}
