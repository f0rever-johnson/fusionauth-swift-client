//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


/**
 * Automatic Identity Provider Encoding & Decoding of any type that conforms to IdentityProvider.
 */

public enum IdentityProviderConverter:Codable, IdentityProvider {
    case Apple(AppleIdentityProvider)
    case EpicGames(EpicGamesIdentityProvider)
    case ExternalJWT(ExternalJWTIdentityProvider)
    case Facebook(FacebookIdentityProvider)
    case Google(GoogleIdentityProvider)
    case HYPR(HYPRIdentityProvider)
    case LinkedIn(LinkedInIdentityProvider)
    case Nintendo(NintendoIdentityProvider)
    case OpenIdConnect(OpenIdConnectIdentityProvider)
    case SAMLv2(SAMLv2IdentityProvider)
    case SAMLv2IdPInitiated(SAMLv2IdPInitiatedIdentityProvider)
    case SonyPSN(SonyPSNIdentityProvider)
    case Steam(SteamIdentityProvider)
    case Twitch(TwitchIdentityProvider)
    case Twitter(TwitterIdentityProvider)
    case Xbox(XboxIdentityProvider)

    private enum CodingKeys:CodingKey{
        case type
        case identityProvider
    }

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let type = try container.decode(IdentityProviderType.self, forKey: .type)
        let svContainer = try decoder.singleValueContainer()
        
        switch type{
        
        case .Apple:
            self = try .Apple(svContainer.decode(AppleIdentityProvider.self))
        case .EpicGames:
            self = try .EpicGames(svContainer.decode(EpicGamesIdentityProvider.self))
        case .ExternalJWT:
            self = try .ExternalJWT(svContainer.decode(ExternalJWTIdentityProvider.self))
        case .Facebook:
            self = try .Facebook(svContainer.decode(FacebookIdentityProvider.self))
        case .Google:
            self = try .Google(svContainer.decode(GoogleIdentityProvider.self))
        case .HYPR:
            self = try .HYPR(svContainer.decode(HYPRIdentityProvider.self))
        case .LinkedIn:
            self = try .LinkedIn(svContainer.decode(LinkedInIdentityProvider.self))
        case .Nintendo:
            self = try .Nintendo(svContainer.decode(NintendoIdentityProvider.self))
        case .OpenIdConnect:
            self = try .OpenIdConnect(svContainer.decode(OpenIdConnectIdentityProvider.self))
        case .SAMLv2:
            self = try .SAMLv2(svContainer.decode(SAMLv2IdentityProvider.self))
        case .SAMLv2IdPInitiated:
            self = try .SAMLv2IdPInitiated(svContainer.decode(SAMLv2IdPInitiatedIdentityProvider.self))
        case .SonyPSN:
            self = try .SonyPSN(svContainer.decode(SonyPSNIdentityProvider.self))
        case .Steam:
            self = try .Steam(svContainer.decode(SteamIdentityProvider.self))
        case .Twitch:
            self = try .Twitch(svContainer.decode(TwitchIdentityProvider.self))
        case .Twitter:
            self = try .Twitter(svContainer.decode(TwitterIdentityProvider.self))
        case .Xbox:
            self = try .Xbox(svContainer.decode(XboxIdentityProvider.self))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var identityProviderContainer = encoder.singleValueContainer()
        switch self {
            case .Apple(let apple):
                try identityProviderContainer.encode(apple)
            case .EpicGames(let epicGames):
                try identityProviderContainer.encode(epicGames)
            case .ExternalJWT(let externalJWT):
                try identityProviderContainer.encode(externalJWT)
            case .Facebook(let facebook):
                try identityProviderContainer.encode(facebook)
            case .Google(let google):
                try identityProviderContainer.encode(google)
            case .HYPR(let hypr):
                try identityProviderContainer.encode(hypr)
            case .LinkedIn(let linkedin):
                try identityProviderContainer.encode(linkedin)
            case .Nintendo(let nintendo):
                try identityProviderContainer.encode(nintendo)
            case .OpenIdConnect(let openIdConnect):
                try identityProviderContainer.encode(openIdConnect)
            case .SAMLv2(let SAMLv2):
                try identityProviderContainer.encode(SAMLv2)
            case .SAMLv2IdPInitiated(let SAMLv2IdpInitated):
                try identityProviderContainer.encode(SAMLv2IdpInitated)
            case .SonyPSN(let sonyPSN):
                try identityProviderContainer.encode(sonyPSN)
            case .Steam(let steam):
                try identityProviderContainer.encode(steam)
            case .Twitch(let twitch):
                try identityProviderContainer.encode(twitch)
            case .Twitter(let twitter):
                try identityProviderContainer.encode(twitter)
            case .Xbox(let xbox):
                try identityProviderContainer.encode(xbox)
     
        }
    }
    
    public func GetType() -> IdentityProviderType{
        switch self{
            case .Apple(_):
                return .Apple
            case .EpicGames(_):
                return .EpicGames
            case .ExternalJWT(_):
                return .ExternalJWT
            case .OpenIdConnect(_):
                return .OpenIdConnect
            case .Facebook(_):
                return .Facebook
            case .Google(_):
                return .Google
            case .HYPR(_):
                return .HYPR
            case .LinkedIn(_):
                return .LinkedIn
            case .Nintendo(_):
                return .Nintendo
            case .SAMLv2(_):
                return.SAMLv2
            case .SAMLv2IdPInitiated(_):
                return .SAMLv2IdPInitiated
            case .SonyPSN(_):
                return .SonyPSN
            case .Steam(_):
                return .Steam
            case .Twitch(_):
                return .Twitch
            case .Twitter(_):
                return .Twitter
            case .Xbox(_):
                return .Xbox
        }
    }
    
    public func GetIdentity() -> IdentityProvider{
        switch self {
            case .Apple(let value):
                return value
            case .EpicGames(let value):
                return value
            case .ExternalJWT(let value):
                return value
            case .Facebook(let value):
                return value
            case .Google(let value):
                return value
            case .HYPR(let value):
                return value
            case .LinkedIn(let value):
                return value
            case .Nintendo(let value):
                return value
            case .OpenIdConnect(let value):
                return value
            case .SAMLv2(let value):
                return value
            case .SAMLv2IdPInitiated(let value):
                return value
            case .SonyPSN(let value):
                return value
            case .Steam(let value):
                return value
            case .Twitch(let value):
                return value
            case .Twitter(let value):
                return value
            case .Xbox(let value):
                return value
        }
    }
}

