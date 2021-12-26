//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///Search request for entity types.
public class EntityTypeSearchRequest:Codable{
   
    public var search:EntityTypeSearchCriteria?
    
    public init(search: EntityTypeSearchCriteria? = nil) {
        self.search = search
    }
    
}
