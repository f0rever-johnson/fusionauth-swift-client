//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

/**
 * Models the JWT Refresh Event. This event will be fired when a JWT is "refreshed" (generated) using a Refresh Token.
 *
 */

public class JWTRefreshEvent:BaseEvent, Codable{

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var applicationId:UUID?
    public var original:String?
    public var refreshToken:String?
    public var token:String?
    public var userId:UUID?
    
    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, original: String? = nil, refreshToken: String? = nil, token: String? = nil, userId: UUID? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.original = original
        self.refreshToken = refreshToken
        self.token = token
        self.userId = userId
    }
    
    
}
