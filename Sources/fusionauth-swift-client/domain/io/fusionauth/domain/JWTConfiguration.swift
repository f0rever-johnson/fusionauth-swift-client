//
//  JWTConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation



///  JWT Configuration for entities.
public struct JWTConfiguration:Enableable, Codable{
 
    public var enabled:Bool? = nil
    public var accessTokenKeyId:UUID? = nil
    public var timeToLiveInSeconds:Int? = nil
    
    public init(enabled: Bool? = nil, accessTokenKeyId: UUID? = nil, timeToLiveInSeconds: Int? = nil) {
        self.enabled = enabled
        self.accessTokenKeyId = accessTokenKeyId
        self.timeToLiveInSeconds = timeToLiveInSeconds
    }

}


