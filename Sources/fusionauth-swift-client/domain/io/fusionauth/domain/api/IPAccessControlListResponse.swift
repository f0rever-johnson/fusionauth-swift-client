//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/20/21.
//

import Foundation

public struct IPAccessControlListResponse:Codable{
   
    public var ipAccessControlList:IPAccessControlList?
    public var ipAccessControlLists:[IPAccessControlList]?
    
    public init(ipAccessControlList: IPAccessControlList? = nil, ipAccessControlLists: [IPAccessControlList]? = nil) {
        self.ipAccessControlList = ipAccessControlList
        self.ipAccessControlLists = ipAccessControlLists
    }
    
    
}
