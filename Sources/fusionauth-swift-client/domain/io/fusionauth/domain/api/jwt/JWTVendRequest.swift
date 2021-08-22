//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public struct JWTVendRequest:Codable{

    public var claims:[String:JSONObject]?
    public var keyId:UUID?
    public var timeToLiveInSeconds:Int?
    
    public init(claims: [String : JSONObject]? = nil, keyId: UUID? = nil, timeToLiveInSeconds: Int? = nil) {
        self.claims = claims
        self.keyId = keyId
        self.timeToLiveInSeconds = timeToLiveInSeconds
    }
}
