//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation


/// Search request for entities
public class EntitySearchResponse:Codable{
   
    public var entities:[Entity]?
    public var total:Int64?
    
    public init(entities: [Entity]? = nil, total: Int64? = nil) {
        self.entities = entities
        self.total = total
    }
    

}
