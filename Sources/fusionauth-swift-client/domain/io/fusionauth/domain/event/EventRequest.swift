//
//  EventRequest.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class EventRequest:BaseEvent, Codable {
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil

    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
    }

}
