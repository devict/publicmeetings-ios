//
//  CreateMeetingData.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/13/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import Foundation

func meetingData() -> [Meeting] {
    var meetings = [Meeting]()
    
    var meeting = Meeting(title: "Mayor's meeting (0)", location: "Wichita")
    meetings.append(meeting)
    meeting = Meeting(title: "Sedgwick County (0)", location: "County")
    meetings.append(meeting)
    meeting = Meeting(title: "State meeting (0)", location: "State")
    meetings.append(meeting)
    meeting = Meeting(title: "Mayor's meeting (1)", location: "Wichita")
    meetings.append(meeting)
    meeting = Meeting(title: "Sedgwick County (1)", location: "County")
    meetings.append(meeting)
    meeting = Meeting(title: "State meeting (1)", location: "State")
    meetings.append(meeting)
    meeting = Meeting(title: "Mayor's meeting (2)", location: "Wichita")
    meetings.append(meeting)
    meeting = Meeting(title: "Sedgwick County (2)", location: "County")
    meetings.append(meeting)
    meeting = Meeting(title: "State meeting (2)", location: "State")
    meetings.append(meeting)
    meeting = Meeting(title: "Mayor's meeting (3)", location: "Wichita")
    meetings.append(meeting)
    meeting = Meeting(title: "Sedgwick County (3)", location: "County")
    meetings.append(meeting)
    meeting = Meeting(title: "State meeting (3)", location: "State")
    meetings.append(meeting)
    meeting = Meeting(title: "Mayor's meeting (4)", location: "Wichita")
    meetings.append(meeting)
    meeting = Meeting(title: "Sedgwick County (4)", location: "County")
    meetings.append(meeting)
    meeting = Meeting(title: "State meeting (4)", location: "State")
    meetings.append(meeting)
    return meetings
}
