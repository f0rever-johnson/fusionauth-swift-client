//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class TenantUsernameConfiguration:Codable{
    
    public var unique:UniqueUsernameConfiguration? = nil
    
    public init(unique: UniqueUsernameConfiguration? = nil) {
        self.unique = unique
    }
}
