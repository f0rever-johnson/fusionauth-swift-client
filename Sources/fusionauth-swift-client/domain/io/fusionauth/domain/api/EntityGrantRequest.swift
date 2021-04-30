//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///  Entity grant API request object.
public class EntityGrantRequest:Codable{
   
    public var grant:EntityGrant? = nil
    
    public init(grant: EntityGrant? = nil) {
        self.grant = grant
    }
}
