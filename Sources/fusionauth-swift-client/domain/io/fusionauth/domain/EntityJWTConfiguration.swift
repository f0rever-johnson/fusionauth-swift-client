//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

///JWT Configuration for entities.

public class EntityJWTConfiguration:Enableable, Codable{

    public var enabled:Bool?
    public var accessTokenKeyid:UUID?
    public var timeToLiveInSeconds:Int?
    
    public init(enabled: Bool? = nil, accessTokenKeyid: UUID? = nil, timeToLiveInSeconds: Int? = nil) {
        self.enabled = enabled
        self.accessTokenKeyid = accessTokenKeyid
        self.timeToLiveInSeconds = timeToLiveInSeconds
    }
}
