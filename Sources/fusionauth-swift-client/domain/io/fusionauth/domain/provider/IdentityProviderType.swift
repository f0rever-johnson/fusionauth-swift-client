//
//  IdentityProviderType.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


/**
 * Identity Provider type options.
 */

public enum IdentityProviderType: String, Codable {
    
    case ExternalJWT = "ExternalJWT"
    case OpenIdConnect = "OpenIdConnect"
    case Facebook = "Facebook"
    case Google = "Google"
    case Twitter = "Twitter"
    case SAMLv2 = "SAMLv2"
}
