//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///Models an entity type that has a specific set of permissions. These are global objects and can be used across tenants.
public struct EntityType:Codable{

    public var data:[String:JSONObject]? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var jwtConfiguration:EntityJWTConfiguration? = nil
    public var lastUpdateInstant:Date? = nil
    public var name:String? = nil
    public var permissions:[EntityTypePermission]? = nil
    
    public init(data: [String : JSONObject]? = nil, id: UUID? = nil, insertInstant: Date? = nil, jwtConfiguration: EntityJWTConfiguration? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, permissions: [EntityTypePermission]? = nil) {
        self.data = data
        self.id = id
        self.insertInstant = insertInstant
        self.jwtConfiguration = jwtConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.permissions = permissions
    }

    
}
