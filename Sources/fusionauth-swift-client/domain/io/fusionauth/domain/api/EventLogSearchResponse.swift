//
//  EventLogSearchResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct EventLogSearchResponse:Codable{
    public var eventLogs:[EventLog]?
    public var total:UInt64?

    public init(eventLogs: [EventLog]? = nil, total: UInt64? = nil) {
        self.eventLogs = eventLogs
        self.total = total
    }

}
