//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///Search response for entity types.
public class EntityTypeSearchResponse:Codable{
    public init(entityTypes: [EntityType]? = nil, total:Int64? = nil) {
        self.entityTypes = entityTypes
        self.total = total
    }
    
    public var entityTypes:[EntityType]? = nil
    public var total:Int64? = nil
    
    
    
}
