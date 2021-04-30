//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

/// Entity grant API response object.
public class EntityGrantResponse:Codable{
  
    
    public var grant:EntityGrant? = nil
    public var grants:[EntityGrant]? = nil
    
    public init(grant: EntityGrant? = nil, grants: [EntityGrant]? = nil) {
        self.grant = grant
        self.grants = grants
    }
    
    
}
