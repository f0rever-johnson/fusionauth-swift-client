//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/18/21.
//

import Foundation

public class RefreshTokenResponse:Codable{
    
    public var refreshToken:RefreshToken?
    public var refreshTokens:[RefreshToken]?
    
    public init(refreshToken: RefreshToken? = nil, refreshTokens: [RefreshToken]? = nil) {
        self.refreshToken = refreshToken
        self.refreshTokens = refreshTokens
    }
}
