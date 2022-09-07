//
//  TestEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class TestEvent:BaseEvent, Codable{

    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var message:String?

    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, message: String? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.message = message
    }
}
