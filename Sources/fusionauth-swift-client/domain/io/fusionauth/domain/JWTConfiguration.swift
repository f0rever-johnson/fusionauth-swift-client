//
//  JWTConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation



///  JWT Configuration. A JWT Configuration for an Application may not be active if it is using the global configuration, the configuration may be <code>enabled = false</code>
public struct JWTConfiguration:Enableable, Codable{
    public var enabled:Bool?
    public var accessTokenKeyId:UUID?
    public var idTokenKeyId:UUID?
    public var refreshTokenExpirationPolicy:RefreshTokenExpirationPolicy?
    public var refreshTokenRevocationPolicy:RefreshTokenRevocationPolicy?
    public var refreshTokenTimeToLiveInMinutes:Int?
    public var timeToLiveInSeconds:Int?
    
    public init(enabled: Bool? = nil, accessTokenKeyId: UUID? = nil, idTokenKeyId: UUID? = nil, refreshTokenExpirationPolicy: RefreshTokenExpirationPolicy? = nil, refreshTokenRevocationPolicy: RefreshTokenRevocationPolicy? = nil, refreshTokenTimeToLiveInMinutes: Int? = nil, timeToLiveInSeconds: Int? = nil) {
        self.enabled = enabled
        self.accessTokenKeyId = accessTokenKeyId
        self.idTokenKeyId = idTokenKeyId
        self.refreshTokenExpirationPolicy = refreshTokenExpirationPolicy
        self.refreshTokenRevocationPolicy = refreshTokenRevocationPolicy
        self.refreshTokenTimeToLiveInMinutes = refreshTokenTimeToLiveInMinutes
        self.timeToLiveInSeconds = timeToLiveInSeconds
    }


}


