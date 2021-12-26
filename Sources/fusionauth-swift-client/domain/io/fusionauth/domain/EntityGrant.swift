//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///  A grant for an entity to a user or another entity.

public class EntityGrant:Codable{

    public var data:[String:JSONObject]?
    public var entity:Entity?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var permissions:[String]?
    public var recipientEntityId:UUID?
    public var userId:UUID?
    
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
