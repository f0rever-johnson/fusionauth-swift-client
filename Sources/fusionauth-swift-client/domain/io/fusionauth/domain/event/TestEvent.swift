//
//  TestEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class TestEvent:BaseEvent, Codable{
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var message:String? = nil

    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, message: String? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.message = message
    }
}
