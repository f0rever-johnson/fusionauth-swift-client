//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/14/22.
//

import Foundation

public class TenantSCIMServerConfiguration:Enableable, Codable{
 
    public var enabled: Bool?
    public var clientEntityTypeId:UUID?
    public var schemas:[String:JSONObject]?
    public var serverEntityTypeId:UUID?
    
    public init(enabled: Bool? = nil, clientEntityTypeId: UUID? = nil, schemas: [String : JSONObject]? = nil, serverEntityTypeId: UUID? = nil) {
        self.enabled = enabled
        self.clientEntityTypeId = clientEntityTypeId
        self.schemas = schemas
        self.serverEntityTypeId = serverEntityTypeId
    }
    
}
