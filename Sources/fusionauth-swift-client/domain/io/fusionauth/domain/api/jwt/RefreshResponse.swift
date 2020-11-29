//
//  RefreshResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
