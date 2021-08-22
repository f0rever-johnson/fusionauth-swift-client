//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public struct EventLogCreateEvent:BaseEvent, Codable{
    
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var eventLog: EventLog?
    
    public init(id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, eventLog: EventLog? = nil) {
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.eventLog = eventLog
    }
}
