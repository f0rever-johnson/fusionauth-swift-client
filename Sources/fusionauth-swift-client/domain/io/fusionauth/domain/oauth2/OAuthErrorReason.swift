//
//  OAuthErrorReason.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public enum OAuthErrorReason:String,Codable{
          case authCodeNotFound = "auth_code_not_found"
          case accessTokenMalformed = "access_token_malformed"
          case accessTokenExpired = "access_token_expired"
          case accessTokenUnavailableForProcessing = "access_token_unavailable_for_processing"
          case accessTokenFailedProcessing = "access_token_failed_processing"
          case refreshTokenNotFound = "refresh_token_not_found"
          case invalidClientId = "invalid_client_id"
          case invalidUserCredentials = "invalid_user_credentials"
          case invalidGrantType = "invalid_grant_type"
          case invalidOrigin = "invalid_origin"
          case invalidPKCECodeVerifier = "invalid_pkce_code_verifier"
          case invalidPKCECodeChallenge = "invalid_pkce_code_challenge"
          case invalidPKCECodeChallenge_method = "invalid_pkce_code_challenge_method"
          case invalidRedirectURI = "invalid_redirect_uri"
          case invalidResponseMode = "invalid_response_mode"
          case invalidResponseType = "invalid_response_type"
          case invalidIdTokenHint = "invalid_id_token_hint"
          case invalidPostLogoutRedirectURI = "invalid_post_logout_redirect_uri"
          case invalidDeviceCode = "invalid_device_code"
          case invalidUserCode = "invalid_user_code"
          case invalidAdditionalClientId = "invalid_additional_client_id"
          case grantTypeDisabled = "grant_type_disabled"
          case missingClientId = "missing_client_id"
          case missingCode = "missing_code"
          case missingDeviceCode = "missing_device_code"
          case missingGrantType = "missing_grant_type"
          case missingRedirectURI = "missing_redirect_uri"
          case missingRefreshToken = "missing_refresh_token"
          case missingResponseType = "missing_response_type"
          case missingToken = "missing_token"
          case missingUserCode = "missing_user_code"
          case missingVerificationURI = "missing_verification_uri"
          case loginPrevented = "login_prevented"
          case userCodeExpired = "user_code_expired"
          case userExpired = "user_expired"
          case userLocked = "user_locked"
          case userNotFound = "user_not_found"
          case clientAuthenticationMissing = "client_authentication_missing"
          case invalidClientAuthenticationScheme = "invalid_client_authentication_scheme"
          case invalidClientAuthentication = "invalid_client_authentication"
          case clientIdMismatch = "client_id_mismatch"
          case unknown = "unknown"
}
