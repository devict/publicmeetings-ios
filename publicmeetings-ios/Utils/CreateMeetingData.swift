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
    var meeting: Meeting
    
    meeting = Meeting(title: "City Council", description: "City council's meeting", location: "Wichita")
    meetings.append(meeting)

    meeting = Meeting(title: "Town Hall", description: "Wichita Town Hall", location: "Wichita")
    meetings.append(meeting)

    meeting = Meeting(title: "City Planning", description: "Discuss planning and zoning laws", location: "Wichita")
    meetings.append(meeting)

    meeting = Meeting(title: "State Wellness Planning", description: "Discuss health and human services", location: "State")
    meetings.append(meeting)
   
    meeting = Meeting(title: "County ", description: "City council's meeting", location: "County")
    meetings.append(meeting)

    meeting = Meeting(title: "Special elections", description: "Election runoff discussion", location: "County")
    meetings.append(meeting)
    
    meeting = Meeting(title: "State planning board", description: "Meeting of the state planners", location: "State")
    meetings.append(meeting)

    meeting = Meeting(title: "County planning board", description: "Meeting of the state planners", location: "County")
    meetings.append(meeting)

    meeting = Meeting(title: "Wichita planning board", description: "Meeting of the state planners", location: "Wichita")
    meetings.append(meeting)

    meeting = Meeting(title: "Town Hall", description: "Wichita Town Hall", location: "Wichita")
    meetings.append(meeting)

    meeting = Meeting(title: "State planning board", description: "Meeting of the state planners", location: "State")
    meetings.append(meeting)

    meeting = Meeting(title: "Wichita Board", description: "Meeting of the Board", location: "Wichita")
    meetings.append(meeting)
   
    meeting = Meeting(title: "General elections", description: "General election meeting", location: "State")
    meetings.append(meeting)

    meeting = Meeting(title: "Primary elections", description: "Primary election meeting", location: "State")
    meetings.append(meeting)
    
    meeting = Meeting(title: "School Board", description: "Discuss local education policy", location: "Wichita")
    meetings.append(meeting)

    return meetings
}


