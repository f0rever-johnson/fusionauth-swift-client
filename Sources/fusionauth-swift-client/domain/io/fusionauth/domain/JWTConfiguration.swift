//
//  JWTConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new JWT Configuration Object.
 * JWT Configuration. A JWT Configuration for an Application may not be active if it is using the global configuration, the configuration
 * may be <code>enabled = false</code>.
 */

public struct JWTConfiguration:Enableable, Codable{
    public var enabled:Bool? = nil
    public var accessTokenKey:UUID? = nil
    public var refreshTokenExpirationPolicy:RefreshTokenExpirationPolicy
    public var refreshTokenRevocationPolicy:RefreshTokenRevocationPolicy
    public var idTokenKey:UUID? = nil
    public var refreshTokenTimeToLiveInMinutes:Int? = nil
    public var refreshTokenUsagePolicy:RefreshTokenUsagePolicy
    public var timeToLiveInSeconds:Int? = nil

    public init(enabled: Bool? = nil, accessTokenKey: UUID? = nil, refreshTokenExpirationPolicy: RefreshTokenExpirationPolicy, refreshTokenRevocationPolicy: RefreshTokenRevocationPolicy, idTokenKey: UUID? = nil, refreshTokenTimeToLiveInMinutes: Int? = nil, refreshTokenUsagePolicy: RefreshTokenUsagePolicy, timeToLiveInSeconds: Int? = nil) {
        self.enabled = enabled
        self.accessTokenKey = accessTokenKey
        self.refreshTokenExpirationPolicy = refreshTokenExpirationPolicy
        self.refreshTokenRevocationPolicy = refreshTokenRevocationPolicy
        self.idTokenKey = idTokenKey
        self.refreshTokenTimeToLiveInMinutes = refreshTokenTimeToLiveInMinutes
        self.refreshTokenUsagePolicy = refreshTokenUsagePolicy
        self.timeToLiveInSeconds = timeToLiveInSeconds
    }
}


