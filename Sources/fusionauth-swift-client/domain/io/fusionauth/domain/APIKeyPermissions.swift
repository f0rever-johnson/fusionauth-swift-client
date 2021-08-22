//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class APIKeyPermissions:Codable{

    public var endpoints:[String:[String]]? 
    
    public init(endpoints: [String : [String]]? = nil) {
        self.endpoints = endpoints
    }
}
