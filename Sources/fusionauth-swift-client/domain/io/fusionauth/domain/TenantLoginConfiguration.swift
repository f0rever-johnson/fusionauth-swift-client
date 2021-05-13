//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class TenantLoginConfiguration:Codable{
   
    public var requireAuthentication:Bool? = nil
    
    public init(requireAuthentication: Bool? = nil) {
        self.requireAuthentication = requireAuthentication
    }
}
