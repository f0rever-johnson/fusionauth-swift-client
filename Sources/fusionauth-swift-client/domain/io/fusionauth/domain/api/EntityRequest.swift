//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

///Entity API request object.

public class EntityRequest:Codable{
  
    public var entity:Entity? = nil
    
    public init(entity: Entity? = nil) {
        self.entity = entity
    }
    
}
