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
    public var applicationConfiguration: [String : SAMLv2ApplicationConfiguration]?
    public var data: [String : JSONObject]?
    public var debug: Bool?
    public var id: UUID?
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var name: String?
    public var type: IdentityProviderType?
    public var enabled: Bool?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?

    public var buttonImageURL:String?
    public var buttonText:String?
    public var domains:[String]?
    public var emailClaim:String?
    public var idpEndpoint:String?
    public var issuer:String?
    public var keyId:UUID?
    public var nameIdFormat:String?
    public var postRequest:Bool?
    public var requestSigningKeyId:UUID?
    public var signRequest:Bool?
    public var uniqueIdClaim:String?
    public var useNameIdForEmail:Bool?
    public var usernameClaim:String?
    
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
