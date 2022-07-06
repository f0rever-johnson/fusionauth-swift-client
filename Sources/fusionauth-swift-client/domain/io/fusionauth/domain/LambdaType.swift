//
//  LambdaType.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * The types of lambdas that indicate how they are invoked by FusionAuth.
 *
 */

public enum LambdaType:String, Codable{
    
    case JWTPopulate = "JWTPopulate"
    case OpenIDreconcile = "OpenIDreconcile"
    case SAMLv2Reconcile = "SAMLV2Reconcile"
    case SAMLv2Populate = "SAMLV2Populate"
    case AppleReconcile = "AppleReconfile"
    case ExternalJWTReconcile = "ExternalJWTReconcile"
    case FacebookReconcile = "FacebookReconcile"
    case GoogleReconcile = "Google Reconcile"
    case HYPRReconcile = "HYPRReconcile"
    case TwitterReconcile = "TwitterReconcile"
    case LDAPConnectorReconcile = "LDAPConnectorReconcile"
    case LinkedInReconcile = "LinkedInReconcile"
    case EpicGamesReconcile = "EpicGamesReconcile"
    case NintendoReconcile = "NintendoReconcile"
    case SonyPSNReconcile = "SonyPSNReconcile"
    case SteamReconcile = "SteamReconcile"
    case TwitchReconcile = "TwitchReconcile"
    case XboxReconcile = "XboxReconcile"
    case ClientCredentialsJWTPopulate = "ClientCredentialsJWTPopulate"
    case SCIMServerGroupRequestConverter = "SCIMServerGroupRequestConverter"
    case SCIMServerGroupResponseConverter = "SCIMServerGroupResponseConverter"
    case SCIMServerUserRequestConverter = "SCIMServerUserRequestConverter"
    case SCIMServerUserResponseConverter = "SCIMServerUserResponseConverter"
}
