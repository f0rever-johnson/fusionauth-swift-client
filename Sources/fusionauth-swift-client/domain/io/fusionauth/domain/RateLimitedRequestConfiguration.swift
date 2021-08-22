//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct RateLimitedRequestConfiguration:Enableable, Codable{
  
    public var enabled: Bool?
    public var limit:Int?
    public var timePeriodInSeconds:Int?
    
    public init(enabled: Bool? = nil, limit: Int? = nil, timePeriodInSeconds: Int? = nil) {
        self.enabled = enabled
        self.limit = limit
        self.timePeriodInSeconds = timePeriodInSeconds
    }
}
