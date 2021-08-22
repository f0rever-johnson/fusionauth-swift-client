//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/20/21.
//

import Foundation

public struct IPAccessControlListRequest:Codable{
    
    public var ipAccessControlList:IPAccessControlList?
    
    public init(ipAccessControlList: IPAccessControlList? = nil) {
        self.ipAccessControlList = ipAccessControlList
    }
}
