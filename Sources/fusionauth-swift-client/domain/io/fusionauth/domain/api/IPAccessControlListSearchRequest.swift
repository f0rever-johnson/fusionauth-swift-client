//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/20/21.
//

import Foundation

public struct IPAccessControlListSearchRequest:Codable{
    public var search:IPAccessControlListSearchCriteria? = nil
    
    public init(search: IPAccessControlListSearchCriteria? = nil) {
        self.search = search
    }
}
