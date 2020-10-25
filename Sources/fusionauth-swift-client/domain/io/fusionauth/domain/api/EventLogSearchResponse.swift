//
//  EventLogSearchResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct EventLogSearchResponse:Codable{
    public var eventLogs:[EventLog]? = nil
    public var total:UInt64? = nil

    public init(eventLogs: [EventLog]? = nil, total: UInt64? = nil) {
        self.eventLogs = eventLogs
        self.total = total
    }

}
