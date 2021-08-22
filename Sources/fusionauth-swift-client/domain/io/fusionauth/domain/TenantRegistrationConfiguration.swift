//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct TenantRegistrationConfiguration:Codable{

    public var blockedDomains:[String]?
    
    public init(blockedDomains: [String]? = nil) {
        self.blockedDomains = blockedDomains
    }
}
