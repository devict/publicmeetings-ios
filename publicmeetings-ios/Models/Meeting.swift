//
//  Meeting.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/1/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import Foundation

enum MeetingType {
    case type
    case subType
}

struct Meeting {
    //let type: MeetingType?
    let title: String
    //let description: String?
    //let date: Date?
    //let agenda: String?
    let location: String
    
    init(title: String, location: String) {
        self.title = title
        self.location = location
    }
}
