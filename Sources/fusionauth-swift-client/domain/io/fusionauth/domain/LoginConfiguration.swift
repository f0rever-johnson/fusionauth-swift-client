//
//  LoginConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class LoginConfiguration:Codable{
    public var allowTokenRefresh:Bool?
    public var generateRefreshTokens:Bool?
    public var requireAuthentication:Bool?

    public init(allowTokenRefresh: Bool? = nil, generateRefreshTokens: Bool? = nil, requireAuthentication: Bool? = nil) {
        self.allowTokenRefresh = allowTokenRefresh
        self.generateRefreshTokens = generateRefreshTokens
        self.requireAuthentication = requireAuthentication
    }

}
