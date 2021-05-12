//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/10/21.
//

import Foundation

public class EntityGrantSearchRequest:Codable{
    
    public var search:EntityGrantSearchCriteria? = nil
    
    public init(search: EntityGrantSearchCriteria? = nil) {
        self.search = search
    }
    
}
