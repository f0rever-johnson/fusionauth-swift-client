//
//  EventLog.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Event log used internally by FusionAuth to help developers debug hooks, Webhooks, email templates, etc.
 *
 */

public class EventLog:Codable{
    public var id:UInt64? = nil
    public var insertInstant:Date? = nil
    public var message:String? = nil
    public var type:EventLogType? = nil


    public init(id: UInt64? = nil, insertInstant: Date? = nil, message: String? = nil, type: EventLogType? = nil) {
        self.id = id
        self.insertInstant = insertInstant
        self.message = message
        self.type = type
    }
}
