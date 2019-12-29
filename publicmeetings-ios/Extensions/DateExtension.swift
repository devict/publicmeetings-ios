//
//  DateExtension.swift
//  Faith
//
//  Created by mpc on 12/5/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import Foundation

extension Date {
    var shortDate: String {
        let fmt  = DateFormatter()
        fmt.dateFormat = "MM-dd"
        let date: String = fmt.string(from: self)
        return date
    }

    var longDate: String {
        let fmt  = DateFormatter()
        fmt.dateFormat = "MM-dd-yyyy"
        let date: String = fmt.string(from: self)
        return date
    }
    
    var shortTime: String {
        let calendar = Calendar.current
        var hour = (calendar as NSCalendar).component(NSCalendar.Unit.hour, from: self)
        let minute = (calendar as NSCalendar).component(NSCalendar.Unit.minute, from: self)
        var ampmFlag = "am"
        
        switch hour {
            case 13...23:
                hour = hour - 12
                ampmFlag = "pm"
            case 12:
                ampmFlag = "pm"
            case 1...11:
                ampmFlag = "am"
            case 0:
                hour = 12
                ampmFlag = "am"
            default: break
        }
        
        let shortTime = "\(String(format: "%01d", hour)):\(String(format: "%02d", minute)) \(ampmFlag)"
        return shortTime
    }
    
    var shortDay: String {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: self)
        
        switch dayOfWeek {
            case 1: return "Sun"
            case 2: return "Mon"
            case 3: return "Tue"
            case 4: return "Wed"
            case 5: return "Thu"
            case 6: return "Fri"
            case 7: return "Sat"
            default: return ""
        }
    }
    
    var longDay: String {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: self)
        
        switch dayOfWeek {
            case 1: return "Sunday"
            case 2: return "Monday"
            case 3: return "Tuesday"
            case 4: return "Wednesday"
            case 5: return "Thursday"
            case 6: return "Friday"
            case 7: return "Saturday"
            default: return ""
        }
    }
    
    var shortMonth: String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        
        switch month {
            case 1: return "Jan"
            case 2: return "Feb"
            case 3: return "Mar"
            case 4: return "Apr"
            case 5: return "May"
            case 6: return "Jun"
            case 7: return "Jul"
            case 8: return "Aug"
            case 9: return "Sep"
            case 10: return "Oct"
            case 11: return "Nov"
            case 12: return "Dec"
            default: return ""
        }
    }
    
    var longMonth: String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        
        switch month {
            case 1: return "January"
            case 2: return "February"
            case 3: return "March"
            case 4: return "April"
            case 5: return "May"
            case 6: return "June"
            case 7: return "July"
            case 8: return "August"
            case 9: return "September"
            case 10: return "October"
            case 11: return "November"
            case 12: return "December"
            default: return ""
        }
    }
}
