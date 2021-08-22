//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public struct KickstartSuccessEvent:BaseEvent{

    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var instanceId:UUID?
    
    public init(id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil) {
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
    }
}
