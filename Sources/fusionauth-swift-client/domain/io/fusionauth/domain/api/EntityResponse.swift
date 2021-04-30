//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

/// Entity API response object.

public class EntityResponse:Codable{
  
    public var entity:Entity? = nil
    
    public init(entity: Entity? = nil) {
        self.entity = entity
    }
}

