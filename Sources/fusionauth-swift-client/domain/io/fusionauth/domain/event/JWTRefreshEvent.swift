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
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var applicationId:UUID? = nil
    public var original:String? = nil
    public var refreshToken:String? = nil
    public var token:String? = nil
    public var userId:UUID?
    
    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, original: String? = nil, refreshToken: String? = nil, token: String? = nil, userId: UUID? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.original = original
        self.refreshToken = refreshToken
        self.token = token
        self.userId = userId
    }
    
    
}
