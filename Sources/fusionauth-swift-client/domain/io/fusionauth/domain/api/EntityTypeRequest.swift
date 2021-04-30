//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

/// Entity Type API request object.
public class EntityTypeRequest:Codable{
  
    public var entityType:EntityType? = nil
    public var permission:EntityTypePermission? = nil
    
    public init(entityType: EntityType? = nil, permission: EntityTypePermission? = nil) {
        self.entityType = entityType
        self.permission = permission
    }
}
