//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///Search response for entity types.
public class EntityTypeSearchResponse:Codable{
   
    public var entityTypes:[EntityType]?
    public var total:Int64?
    
    public init(entityTypes: [EntityType]? = nil, total:Int64? = nil) {
        self.entityTypes = entityTypes
        self.total = total
    }
    
    
    
}
