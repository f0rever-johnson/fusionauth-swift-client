//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation


///Search request for entities
public class EntitySearchRequest:Codable{
   
    public var search:EntitySearchCriteria?
    
    public init(search: EntitySearchCriteria? = nil) {
        self.search = search
    }
}
