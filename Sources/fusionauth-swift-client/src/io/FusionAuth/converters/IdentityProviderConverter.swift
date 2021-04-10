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

    case ExternalJWT(ExternalJWTIdentityProvider)
    case OpenIdConnect(OpenIdConnectIdentityProvider)
    case Facebook(FacebookIdentityProvider)
    case Google(GoogleIdentityProvider)
    case Twitter(TwitterIdentityProvider)
    case SAMLv2(SAMLv2IdentityProvider)
    case Apple(AppleIdentityProvider)
    case HYPR(HYPRIdentityProvider)
    case LinkedIn(LinkedInIdentityProvider)
    
    private enum CodingKeys:CodingKey{
        case type
        case identityProvider
    }

    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        let values = try container.decode(Dictionary<String, JSONObject>.self, forKey: .identityProvider)
//
//        let typeString:String = values["type"]?.jsonString() ?? ""
//
//        let type:IdentityProviderType = IdentityProviderType.init(rawValue: typeString)!
//
//        switch type {
//            case .ExternalJWT:
//                self = .ExternalJWT(try container.decode(ExternalJWTIdentityProvider.self, forKey: .identityProvider))
//            case .Facebook:
//                self = .Facebook(try container.decode(FacebookIdentityProvider.self, forKey: .identityProvider))
//            case .Google:
//                self = .Google(try container.decode(GoogleIdentityProvider.self, forKey: .identityProvider))
//            case .OpenIdConnect:
//                self = .OpenIdConnect(try container.decode(OpenIdConnectIdentityProvider.self, forKey: .identityProvider))
//            case .Twitter:
//                self = .Twitter(try container.decode(TwitterIdentityProvider.self, forKey: .identityProvider))
//            case .SAMLv2:
//                self = .SAMLv2(try container.decode(SAMLv2IdentityProvider.self, forKey: .identityProvider))
//            case .Apple:
//                self = .Apple(try container.decode(AppleIdentityProvider.self, forKey: .identityProvider))
//            case .HYPR:
//                self = .HYPR(try container.decode(HYPRIdentityProvider.self, forKey: .identityProvider))
//            case .LinkedIn:
//                self = .LinkedIn(try container.decode(LinkedInIdentityProvider.self, forKey: .identityProvider))
//        }
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let type = try container.decode(IdentityProviderType.self, forKey: .type)
        let svContainer = try decoder.singleValueContainer()
        
        switch type{

        case .ExternalJWT:
            self = try .ExternalJWT(svContainer.decode(ExternalJWTIdentityProvider.self))
        case .OpenIdConnect:
            self = try .OpenIdConnect(svContainer.decode(OpenIdConnectIdentityProvider.self))
        case .Facebook:
            self = try .Facebook(svContainer.decode(FacebookIdentityProvider.self))
        case .Google:
            self = try .Google(svContainer.decode(GoogleIdentityProvider.self))
        case .Twitter:
            self = try .Twitter(svContainer.decode(TwitterIdentityProvider.self))
        case .SAMLv2:
            self = try .SAMLv2(svContainer.decode(SAMLv2IdentityProvider.self))
        case .HYPR:
            self = try .HYPR(svContainer.decode(HYPRIdentityProvider.self))
        case .Apple:
            self = try .Apple(svContainer.decode(AppleIdentityProvider.self))
        case .LinkedIn:
            self = try .LinkedIn(svContainer.decode(LinkedInIdentityProvider.self))
        }
    
    }

    public func encode(to encoder: Encoder) throws {
        var identityProviderContainer = encoder.singleValueContainer()
        switch self {
            case .ExternalJWT(let externalJWT):
                try identityProviderContainer.encode(externalJWT)
            case .OpenIdConnect(let openIdConnect):
                try identityProviderContainer.encode(openIdConnect)
            case .Facebook(let facebook):
                try identityProviderContainer.encode(facebook)
            case .Google(let google):
                try identityProviderContainer.encode(google)
            case .Twitter(let twitter):
                try identityProviderContainer.encode(twitter)
            case .SAMLv2(let samlv2):
                try identityProviderContainer.encode(samlv2)
            case .Apple(let apple):
                try identityProviderContainer.encode(apple)
            case .HYPR(let hypr):
                try identityProviderContainer.encode(hypr)
            case .LinkedIn(let linkedin):
                try identityProviderContainer.encode(linkedin)
        }
    }
    
    public func GetType() -> IdentityProviderType{
        switch self{
            
            case .ExternalJWT(_):
                return .ExternalJWT
            case .OpenIdConnect(_):
                return .OpenIdConnect
            case .Facebook(_):
                return.Facebook
            case .Google(_):
                return.Google
            case .Twitter(_):
                return.Twitter
            case .SAMLv2(_):
                return.SAMLv2
            case .Apple(_):
                return.Apple
            case .HYPR(_):
                return .HYPR
            case .LinkedIn(_):
                return .LinkedIn
        }
    }
    
    public func GetIdentity() -> IdentityProvider{
        switch self {
           
            case .ExternalJWT(let value):
                return value
            case .OpenIdConnect(let value):
                return value
            case .Facebook(let value):
                return value
            case .Google(let value):
                return value
            case .Twitter(let value):
                return value
            case .SAMLv2(let value):
                return value
            case .Apple(let value):
                return value
            case .HYPR(let value):
                return value
            case .LinkedIn(let value):
                return value
        }
    }
}

