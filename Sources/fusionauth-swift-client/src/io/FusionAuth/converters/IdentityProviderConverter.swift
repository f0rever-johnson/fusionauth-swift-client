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

public enum IdentityProviderConverter:Codable {

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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let values = try container.decode(Dictionary<String, JSONObject>.self, forKey: .identityProvider)

        let typeString:String = values["type"]?.jsonString() ?? ""

        let type:IdentityProviderType = IdentityProviderType.init(rawValue: typeString)!

        switch type {
            case .ExternalJWT:
                self = .ExternalJWT(try container.decode(ExternalJWTIdentityProvider.self, forKey: .identityProvider))
            case .Facebook:
                self = .Facebook(try container.decode(FacebookIdentityProvider.self, forKey: .identityProvider))
            case .Google:
                self = .Google(try container.decode(GoogleIdentityProvider.self, forKey: .identityProvider))
            case .OpenIdConnect:
                self = .OpenIdConnect(try container.decode(OpenIdConnectIdentityProvider.self, forKey: .identityProvider))
            case .Twitter:
                self = .Twitter(try container.decode(TwitterIdentityProvider.self, forKey: .identityProvider))
            case .SAMLv2:
                self = .SAMLv2(try container.decode(SAMLv2IdentityProvider.self, forKey: .identityProvider))
            case .Apple:
                self = .Apple(try container.decode(AppleIdentityProvider.self, forKey: .identityProvider))
            case .HYPR:
                self = .HYPR(try container.decode(HYPRIdentityProvider.self, forKey: .identityProvider))
            case .LinkedIn:
                self = .LinkedIn(try container.decode(LinkedInIdentityProvider.self, forKey: .identityProvider))
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
}

