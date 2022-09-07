//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/18/21.
//

import Foundation

//Using a different response object from RefreshTokenResponse because the retrieve response will return an object for refreshToken, and this is a string.

public class JWTRefreshResponse:Codable{
 
    public var refreshToken:String?
    public var refreshTokenId:UUID?
    public var token:String?
    
    public init(refreshToken: String? = nil, refreshTokenId: UUID? = nil, token: String? = nil) {
        self.refreshToken = refreshToken
        self.refreshTokenId = refreshTokenId
        self.token = token
    }
    
}
