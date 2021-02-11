//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class TenantUserDeletePolicy:Codable{
    public var unverified:TimeBasedDeletePolicy? = nil
    
    public init(unverified: TimeBasedDeletePolicy? = nil) {
        self.unverified = unverified
    }
}
