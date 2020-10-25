//
//  RefreshResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct RefreshResponse:Codable{
    public var refreshTokens:[RefreshToken]? = nil
    public var token:AccessToken? = nil

    public init(refreshTokens: [RefreshToken]? = nil, token: AccessToken? = nil) {
        self.refreshTokens = refreshTokens
        self.token = token
    }

}
