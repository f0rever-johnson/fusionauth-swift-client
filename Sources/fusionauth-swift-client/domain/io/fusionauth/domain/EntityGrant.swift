//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///  A grant for an entity to a user or another entity.

public class EntityGrant:Codable{

    public var data:[String:JSONObject]? = nil
    public var entity:Entity? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var permissions:[String]? = nil
    public var recipientEntityId:UUID? = nil
    public var userId:UUID? = nil
    
    public init(data: [String : JSONObject]? = nil, entity: Entity? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, permissions: [String]? = nil, recipientEntityId: UUID? = nil, userId: UUID? = nil) {
        self.data = data
        self.entity = entity
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.permissions = permissions
        self.recipientEntityId = recipientEntityId
        self.userId = userId
    }
    
    
    
    
    
}
