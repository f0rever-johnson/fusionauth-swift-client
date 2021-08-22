//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public struct IPAccessControlListSearchResponse:Codable{

    public var ipAccessControlLists:[IPAccessControlList]?
    public var total:Int?
    
    public init(ipAccessControlLists: [IPAccessControlList]? = nil, total: Int? = nil) {
        self.ipAccessControlLists = ipAccessControlLists
        self.total = total
    }
}
