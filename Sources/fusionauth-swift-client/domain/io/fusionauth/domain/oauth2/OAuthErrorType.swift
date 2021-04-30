//
//  OAuthErrorType.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public enum OAuthErrorType:String, Codable{
    case invalidRequest = "invalid_request"
    case invalidClient = "invalid_client"
    case invalidGrant = "invalid_grant"
    case invalidToken = "invalid_token"
    case unauthorizedClient = "unauthorized_client"
    case invalidScope = "invalid_scope"
    case serverError = "server_error"
    case unsupportdGrantType = "unsupported_grant_type"
    case unsupportedResponseType = "unsupported_response_typ"
    case changePasswordRequired = "change_password_required"
    case notLicensed = "not_licensed"
    case twoFactorRequired = "two_factor_required"
    case authorizationPending = "authorization_pending"
    case expiredToken = "expired_token"
    case unsupportedTokenType = "unsupported_token_type"
}
