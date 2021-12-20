//
//  SAMLv2IdentityProvider.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class SAMLv2IdentityProvider:BaseIdentityProvider{
    
    public typealias D = SAMLv2ApplicationConfiguration
   
    //BaseIdentityProvider protocol requirements
    public var applicationConfiguration: [String : SAMLv2ApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    public var linkingStrategy: IdentityProviderLinkingStrategy? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil

    public var buttonImageURL:String? = nil
    public var buttonText:String? = nil
    public var domains:[String]? = nil
    public var emailClaim:String? = nil
    public var idpEndpoint:String? = nil
    public var issuer:String? = nil
    public var keyId:UUID? = nil
    public var nameIdFormat:String? = nil
    public var postRequest:Bool? = nil
    public var requestSigningKeyId:UUID? = nil
    public var signRequest:Bool? = nil
    public var uniqueIdClaim:String? = nil
    public var useNameIdForEmail:Bool? = nil
    public var usernameClaim:String? = nil
    
    public init(applicationConfiguration: [String : SAMLv2ApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil, buttonImageURL: String? = nil, buttonText: String? = nil, domains: [String]? = nil, emailClaim: String? = nil, idpEndpoint: String? = nil, issuer: String? = nil, keyId: UUID? = nil, nameIdFormat: String? = nil, postRequest: Bool? = nil, requestSigningKeyId: UUID? = nil, signRequest: Bool? = nil, uniqueIdClaim: String? = nil, useNameIdForEmail: Bool? = nil, usernameClaim: String? = nil) {
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.name = name
        self.type = type
        self.enabled = enabled
        self.tenantConfiguration = tenantConfiguration
        self.buttonImageURL = buttonImageURL
        self.buttonText = buttonText
        self.domains = domains
        self.emailClaim = emailClaim
        self.idpEndpoint = idpEndpoint
        self.issuer = issuer
        self.keyId = keyId
        self.nameIdFormat = nameIdFormat
        self.postRequest = postRequest
        self.requestSigningKeyId = requestSigningKeyId
        self.signRequest = signRequest
        self.uniqueIdClaim = uniqueIdClaim
        self.useNameIdForEmail = useNameIdForEmail
        self.usernameClaim = usernameClaim
    }
   

}
