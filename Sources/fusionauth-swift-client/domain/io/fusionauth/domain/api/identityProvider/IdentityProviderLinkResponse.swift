//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct IdentityProviderLinkResponse:Codable{
   
    public var identityProviderlink:IdentityProviderLink?
    public var identityProdierLinks:[IdentityProviderLink]?
    
    public init(identityProviderlink: IdentityProviderLink? = nil, identityProdierLinks: [IdentityProviderLink]? = nil) {
        self.identityProviderlink = identityProviderlink
        self.identityProdierLinks = identityProdierLinks
    }
}
