//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class IdentityProviderDetails{
    public var applications:[UUID]?
    public var id:UUID?
    public var idpEndpoint:String?
    public var name:String?
    public var oauth2:IdentityProviderOAuth2Configuration?
    public var type:IdentityProviderType?
    
    public init(applications: [UUID]? = nil, id: UUID? = nil, idpEndpoint: String? = nil, name: String? = nil, oauth2: IdentityProviderOAuth2Configuration? = nil, type: IdentityProviderType? = nil) {
        self.applications = applications
        self.id = id
        self.idpEndpoint = idpEndpoint
        self.name = name
        self.oauth2 = oauth2
        self.type = type
    }
}
