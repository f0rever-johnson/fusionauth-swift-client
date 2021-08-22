//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct ApplicationAccessControlConfiguration:Codable{
  
    public var uiIPAccessControlListId:UUID?
    
    public init(uiIPAccessControlListId: UUID? = nil) {
        self.uiIPAccessControlListId = uiIPAccessControlListId
    }
}
