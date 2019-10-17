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

    var title: String
    var description: String
    var date: Date?
    var location: String
    
    init(title: String = "", description: String = "", location: String) {
        self.title = title
        self.description = description
        self.location = location
        self.date = generateFutureDate()
    }

    func generateFutureDate() -> Date {
        let day = arc4random_uniform(UInt32.max) % 120
        let hour = 0
        let minute = 0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = Int(day)
        offsetComponents.hour = hour
        offsetComponents.minute = minute
        
        guard let randomDate = gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0)) else { return Date() }
        guard let returnDate = dateFormatter.date(from: randomDate.description) else { return Date() }
        
        return returnDate
    }
}
