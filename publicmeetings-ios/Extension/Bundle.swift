//
//  Bundle.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/13/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
