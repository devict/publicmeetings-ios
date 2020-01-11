//
//  LoginViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 1/8/20.
//  Copyright © 2020 mpc. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController, CloseButtonDelegate {

    var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var closeButton: CloseButton = {
        let button = CloseButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var signinButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton(type: .signIn, style: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
        setupActions()
    }
    
    func setupView() {
        [loginView, closeButton, signinButton].forEach { view.addSubview($0) }

        closeButton.delegate = self
        closeButton.tintColor = .white
        closeButton.setSystemImage(systemImage: "xmark")
    }

    func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 3.0),
            closeButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 3.0),
            closeButton.widthAnchor.constraint(equalToConstant: 50.0),
            closeButton.heightAnchor.constraint(equalToConstant: 50.0),

            signinButton.topAnchor.constraint(equalTo: loginView.forgotPassword.bottomAnchor, constant: 10.0),
            signinButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            signinButton.widthAnchor.constraint(equalToConstant: 160.0),
            signinButton.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }
    
    func setupActions() {
        signinButton.addTarget(self, action: #selector(signinButtonTapped), for: .touchUpInside)
    }
    
    @objc func signinButtonTapped() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }

    //MARK: - Actions
    func closeButtonTapped() {
        print("view.closeButtonTapped")
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        //TODO: Proper error handling
        print("Error with Apple Authorization")
        self.dismiss(animated: false, completion: nil)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            case let credentials as ASAuthorizationAppleIDCredential:
                let _ = User(credentials: credentials)
            default:
                break
        }

        self.dismiss(animated: false, completion: nil)
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let window = view.window else { return ASPresentationAnchor() }
        return window
    }
}
