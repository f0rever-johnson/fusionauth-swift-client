//
//  EventRequest.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class EventRequest:BaseEvent, Codable {
    
    public var info: EventInfo?
    public var type: EventType?
    public var createInstant: Date?
    public var id: UUID?
    public var tenantId: UUID?
    
    public init(info: EventInfo? = nil, type: EventType? = nil, createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil) {
        self.info = info
        self.type = type
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
    }

}
