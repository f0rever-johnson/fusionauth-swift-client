//
//  EventLogResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct EventLogResponse:Codable{
    public var eventLog:EventLog? = nil

    public init(eventLog: EventLog? = nil) {
        self.eventLog = eventLog
    }

}
