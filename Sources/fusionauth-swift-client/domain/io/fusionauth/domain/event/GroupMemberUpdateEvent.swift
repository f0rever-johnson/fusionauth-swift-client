//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 9/6/22.
//

import Foundation

/**
   * Models the Group Member Update Event.
   *
   */

public class GroupMemberUpdateEvent:BaseEvent, Codable{
  
    public var createInstant: Date?
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var group:Group?
    public var members:[GroupMember]?
    
    public init(createInstant: Date? = nil, id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, group: Group? = nil, members:[GroupMember]? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.group = group
        self.members = members
    }
    
}
