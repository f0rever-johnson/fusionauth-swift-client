//
//  GrantType.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Grant Type Options.
 */

public enum GrantType:String, Codable{
    case authorization = "authorization_code"
    case implicit = "implicit"
    case password = "password"
    case clientCredentials = "client_credentials"
    case refreshToken = "refresh_token"
    case unknown = "unknown"
    case deviceCode = "urn:ietf:params:oauth:grant-type:device_code"
}
