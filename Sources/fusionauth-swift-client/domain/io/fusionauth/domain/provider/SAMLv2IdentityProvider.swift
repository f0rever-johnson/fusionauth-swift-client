//
//  SAMLv2IdentityProvider.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class SAMLv2IdentityProvider:BaseIdentityProvider{
    public typealias D = SAMLv2ApplicationConfiguration
    
    
    public var applicationConfiguration: [UUID : SAMLv2ApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var buttonImageURL:String? = nil
    public var buttonText:String? = nil
    public var domains:[String]? = nil
    public var emailClaim:String? = nil
    public var idpEndpoint:String? = nil
    public var issuer:String? = nil
    public var keyId:UUID? = nil
    public var lambdaConfiguration:LambdaConfiguration? = nil
    public var useNameIdForEmail:Bool? = nil

    public init(applicationConfiguration: [UUID : SAMLv2ApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonImageURL: String? = nil, buttonText: String? = nil, domains: [String]? = nil, emailClaim: String? = nil, idpEndpoint: String? = nil, issuer: String? = nil, keyId: UUID? = nil, lambdaConfiguration: LambdaConfiguration? = nil, useNameIdForEmail: Bool? = nil) {
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.name = name
        self.type = type
        self.enabled = enabled
        self.buttonImageURL = buttonImageURL
        self.buttonText = buttonText
        self.domains = domains
        self.emailClaim = emailClaim
        self.idpEndpoint = idpEndpoint
        self.issuer = issuer
        self.keyId = keyId
        self.lambdaConfiguration = lambdaConfiguration
        self.useNameIdForEmail = useNameIdForEmail
    }


}
