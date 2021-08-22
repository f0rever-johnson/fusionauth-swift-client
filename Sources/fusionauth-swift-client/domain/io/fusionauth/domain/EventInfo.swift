//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct EventInfo:Codable{

    public var data:[String:JSONObject]?
    public var deviceDescription:String?
    public var deviceType:String?
    public var ipAddress:String?
    public var location:Location?
    public var os:String?
    public var userAgent:String?
    
    public init(data: [String : JSONObject]? = nil, deviceDescription: String? = nil, deviceType: String? = nil, ipAddress: String? = nil, location: Location? = nil, os: String? = nil, userAgent: String? = nil) {
        self.data = data
        self.deviceDescription = deviceDescription
        self.deviceType = deviceType
        self.ipAddress = ipAddress
        self.location = location
        self.os = os
        self.userAgent = userAgent
    }
    
}
