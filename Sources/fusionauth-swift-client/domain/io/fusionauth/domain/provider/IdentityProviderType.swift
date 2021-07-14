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
    
    case Apple = "Apple"
    case EpicGames = "EpicGames"
    case ExternalJWT = "ExternalJWT"
    case Facebook = "Facebook"
    case Google = "Google"
    case HYPR = "HYPR"
    case LinkedIn = "LinkedIn"
    case Nintendo = "Nintendo"
    case OpenIdConnect = "OpenIdConnect"
    case SAMLv2 = "SAMLv2"
    case SAMLv2IdPInitiated = "SAMLv2IdPInitiated"
    case SonyPSN = "SonyPSN"
    case Steam = "Steam"
    case Twitch = "Twitch"
    case Twitter = "Twitter"
    case Xbox = "Xbox"
    
    
    
}
