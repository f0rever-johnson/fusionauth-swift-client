//
//  EventLogResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct EventLogResponse:Codable{
    public var eventLog:EventLog? = nil

    public init(eventLog: EventLog? = nil) {
        self.eventLog = eventLog
    }

}
