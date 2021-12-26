//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///Entity Type API response object.

public class EntityTypeResponse:Codable{
 
    public var entityType:EntityType?
    public var entityTypes:[EntityType]?
    public var permission:EntityTypePermission?
    
    public init(entityType: EntityType? = nil, entityTypes: [EntityType]? = nil, permission: EntityTypePermission? = nil) {
        self.entityType = entityType
        self.entityTypes = entityTypes
        self.permission = permission
    }
}
