//
//  AccessToken.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

/**
 * Creates a new Access Token Object.
 */

public struct AccessToken:Codable {
    public var accessToken:String? = nil
    public var expiresIn:Int? = nil
    public var idToken:String? = nil
    public var refreshToken:String? = nil
    public var tokenType:TokenType? = nil
    public var userId:UUID? = nil

    public init(accessToken: String? = nil, expiresIn: Int? = nil, idToken: String? = nil, refreshToken: String? = nil, tokenType: TokenType? = nil, userId: UUID? = nil) {
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.idToken = idToken
        self.refreshToken = refreshToken
        self.tokenType = tokenType
        self.userId = userId
    }

    private enum CodingKeys:String, CodingKey{
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case idToken = "id_token"
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
        case userId
    }

}
