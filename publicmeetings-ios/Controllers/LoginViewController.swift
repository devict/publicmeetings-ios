//
//  LoginViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 1/8/20.
//  Copyright © 2020 mpc. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {

    var signinButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
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
        view.addSubview(signinButton)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signinButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //signinButton.widthAnchor.constraint(equalToConstant: 100.0),
            //signinButton.heightAnchor.constraint(equalToConstant: 35.0)
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
                let user = User(credentials: credentials)
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
