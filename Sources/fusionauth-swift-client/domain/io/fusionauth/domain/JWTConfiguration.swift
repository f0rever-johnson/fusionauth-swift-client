//
//  JWTConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation



///  JWT Configuration. A JWT Configuration for an Application may not be active if it is using the global configuration, the configuration may be <code>enabled = false</code>
public struct JWTConfiguration:Enableable, Codable{
    public var enabled:Bool? = nil
    public var accessTokenKeyId:UUID? = nil
    public var idTokenKeyId:UUID? = nil
    public var refreshTokenExpirationPolicy:RefreshTokenExpirationPolicy? = nil
    public var refreshTokenRevocationPolicy:RefreshTokenRevocationPolicy? = nil
    public var refreshTokenTimeToLiveInMinutes:Int? = nil
    public var timeToLiveInSeconds:Int? = nil
    
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


