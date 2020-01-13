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

    var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter username"
        label.textColor = .white
        label.font = Standard.systemFont
        return label
    }()

    var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter password"
        label.textColor = .white
        label.font = Standard.systemFont
        return label
    }()

    var username: UITextField = {
        let text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .clear
        text.autocapitalizationType = .none
        text.textColor = .black
        text.backgroundColor = .systemGray4
        return text
    }()

    var password: UITextField = {
        let text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .clear
        text.autocapitalizationType = .none
        text.textColor = .black
        text.backgroundColor = .systemGray4
        return text
    }()

    var login: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.6
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    var forgotPassword: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot password", for: .normal)
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 0.6
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    var register: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register account", for: .normal)
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 0.6
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupLayout()
        setupActions()

        username.becomeFirstResponder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        username.layer.cornerRadius = Standard.appleRadius
        password.layer.cornerRadius = Standard.appleRadius
        register.layer.cornerRadius = Standard.appleRadius
        login.layer.cornerRadius = Standard.appleRadius
        forgotPassword.layer.cornerRadius = Standard.appleRadius
    }

    func getPointForView(_ view : UIView) -> (x: CGFloat, y: CGFloat) {
        let x = view.frame.origin.x
        let y = view.frame.origin.y
        return (x, y)
    }

    //MARK: - Setup and Layout
    private func setupView() {
        [imageView, usernameLabel, username, passwordLabel, password, login, forgotPassword, register].forEach { addSubview($0) }
        tintColor = .white
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 130.0),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65.0),
            usernameLabel.widthAnchor.constraint(equalToConstant: 120.0),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20.0),

            username.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 2.0),
            username.centerXAnchor.constraint(equalTo: centerXAnchor),
            username.widthAnchor.constraint(equalToConstant: 160.0),
            username.heightAnchor.constraint(equalToConstant: 35.0),

            passwordLabel.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 2.0),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65.0),
            passwordLabel.widthAnchor.constraint(equalToConstant: 120.0),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20.0),

            password.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 2.0),
            password.centerXAnchor.constraint(equalTo: centerXAnchor),
            password.widthAnchor.constraint(equalToConstant: 160.0),
            password.heightAnchor.constraint(equalToConstant: 35.0),

            login.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20.0),
            login.centerXAnchor.constraint(equalTo: centerXAnchor),
            login.widthAnchor.constraint(equalToConstant: 160.0),
            login.heightAnchor.constraint(equalToConstant: 35.0),

            register.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25.0),
            register.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -75.0),
            register.widthAnchor.constraint(equalToConstant: 160.0),
            register.heightAnchor.constraint(equalToConstant: 35.0),

            forgotPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25.0),
            forgotPassword.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -75.0),
            forgotPassword.widthAnchor.constraint(equalToConstant: 160.0),
            forgotPassword.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }

    private func setupActions() {
        login.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        register.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        forgotPassword.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
    }


    @objc func registerTapped() {
        print("registerTapped")
    }

    @objc func forgetPasswordTapped() {
        print("forgetPasswordTapped")
    }

    @objc func loginTapped() {
        self.endEditing(true)
    }
}
