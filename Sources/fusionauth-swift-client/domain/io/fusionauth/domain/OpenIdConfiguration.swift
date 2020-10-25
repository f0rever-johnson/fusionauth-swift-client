//
//  OpenIdConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

public class OpenIdConfiguration:Codable{
    public var authorizationEndpoint:String? = nil
    public var backChannelLogoutSupported:Bool? = nil
    public var claimsSupported:[String]? = nil
    public var deviceAuthorizationEndpoint:String? = nil
    public var endSessionEndpoint:String? = nil
    public var frontChannelLogoutSupported:Bool? = nil
    public var grantTypesSupported:[String]? = nil
    public var idTokenSigningalgValuesSupported:[String]? = nil
    public var issuer:String? = nil
    public var jwksUri:String? = nil
    public var responseModesSupported:[String]? = nil
    public var responseTypesSupported:[String]? = nil
    public var scopesSupported:[String]? = nil
    public var subjectTypesSupported:[String]? = nil
    public var tokenEndpoint:String? = nil
    public var tokenEndpointAuthMethodsSupported:[String]? = nil
    public var userInfoEndpoint:String? = nil
    public var userInfoSigningalgValuesSupported:[String]? = nil

    public init(authorizationEndpoint: String? = nil, backChannelLogoutSupported: Bool? = nil, claimsSupported: [String]? = nil, deviceAuthorizationEndpoint: String? = nil, endSessionEndpoint: String? = nil, frontChannelLogoutSupported: Bool? = nil, grantTypesSupported: [String]? = nil, idTokenSigningalgValuesSupported: [String]? = nil, issuer: String? = nil, jwksUri: String? = nil, responseModesSupported: [String]? = nil, responseTypesSupported: [String]? = nil, scopesSupported: [String]? = nil, subjectTypesSupported: [String]? = nil, tokenEndpoint: String? = nil, tokenEndpointAuthMethodsSupported: [String]? = nil, userInfoEndpoint: String? = nil, userInfoSigningalgValuesSupported: [String]? = nil) {
        self.authorizationEndpoint = authorizationEndpoint
        self.backChannelLogoutSupported = backChannelLogoutSupported
        self.claimsSupported = claimsSupported
        self.deviceAuthorizationEndpoint = deviceAuthorizationEndpoint
        self.endSessionEndpoint = endSessionEndpoint
        self.frontChannelLogoutSupported = frontChannelLogoutSupported
        self.grantTypesSupported = grantTypesSupported
        self.idTokenSigningalgValuesSupported = idTokenSigningalgValuesSupported
        self.issuer = issuer
        self.jwksUri = jwksUri
        self.responseModesSupported = responseModesSupported
        self.responseTypesSupported = responseTypesSupported
        self.scopesSupported = scopesSupported
        self.subjectTypesSupported = subjectTypesSupported
        self.tokenEndpoint = tokenEndpoint
        self.tokenEndpointAuthMethodsSupported = tokenEndpointAuthMethodsSupported
        self.userInfoEndpoint = userInfoEndpoint
        self.userInfoSigningalgValuesSupported = userInfoSigningalgValuesSupported
    }

    private enum CodingKeys: String, CodingKey{
        case authorizationEndpoint = "authorization_endpoint"
        case backChannelLogoutSupported = "backchannel_logout_supported"
        case claimsSupported = "claims_supported"
        case deviceAuthorizationEndpoint = "device_authorization_endpoint"
        case endSessionEndpoint = "end_session_endpoint"
        case frontChannelLogoutSupported = "frontchannel_logout_supported"
        case grantTypesSupported = "grant_types_supported"
        case idTokenSigningalgValuesSupported = "id_token_signing_alg_values_supported"
        case issuer = "issuer"
        case jwksUri = "jwks_uri"
        case responseModesSupported = "response_modes_supported"
        case responseTypesSupported = "response_types_supported"
        case scopesSupported = "scopes_supported"
        case subjectTypesSupported = "subject_types_supported"
        case tokenEndpoint = "token_endpoint"
        case tokenEndpointAuthMethodsSupported = "token_endpoint_auth_methods_supported"
        case userInfoEndpoint = "userinfo_endpoint"
        case userInfoSigningalgValuesSupported = "userinfo_signing_alg_values_supported"
    }
}

