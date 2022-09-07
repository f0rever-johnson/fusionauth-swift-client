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

    public var accessToken:String?
    public var expiresIn:Int?
    public var idToken:String?
    public var refreshToken:String?
    public var refreshTokenId:UUID?
    public var tokenType:TokenType?
    public var userId:UUID?

    public init(accessToken: String? = nil, expiresIn: Int? = nil, idToken: String? = nil, refreshToken: String? = nil, refreshTokenId: UUID? = nil, tokenType: TokenType? = nil, userId: UUID? = nil) {
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.idToken = idToken
        self.refreshToken = refreshToken
        self.refreshTokenId = refreshTokenId
        self.tokenType = tokenType
        self.userId = userId
    }

    private enum CodingKeys:String, CodingKey{
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case idToken = "id_token"
        case refreshToken = "refresh_token"
        case refreshTokenId = "refresh_token_id"
        case tokenType = "token_type"
        case userId
    }

}
