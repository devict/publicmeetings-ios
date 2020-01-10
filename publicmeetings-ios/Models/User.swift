//
//  User.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/1/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import Foundation
import AuthenticationServices

struct User {
    let id: String
    let name: String?
    let firstName: String
    let lastName: String
    let email: String
    let admin: Bool?
    
    init(credentials: ASAuthorizationAppleIDCredential) {
        self.id = credentials.user
        self.firstName = credentials.fullName?.givenName ?? ""
        self.lastName = credentials.fullName?.familyName ?? ""
        self.email = credentials.email ?? ""
        self.name = self.firstName + " " + self.lastName
        self.admin = false
    }
}
