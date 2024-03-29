//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

/// Models an entity that a user can be granted permissions to. Or an entity that can be granted permissions to another entity.

public class Entity:Codable{
    
    public var clientId:String?
    public var clientSecret:String?
    public var data:[String:JSONObject]?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var parentId:UUID?
    public var tenantId:UUID?
    public var type:EntityType?
    
    public init(clientId: String? = nil, clientSecret: String? = nil, data: [String : JSONObject]? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, parentId: UUID? = nil, tenantId: UUID? = nil, type: EntityType? = nil) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.data = data
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.parentId = parentId
        self.tenantId = tenantId
        self.type = type
    }
}
