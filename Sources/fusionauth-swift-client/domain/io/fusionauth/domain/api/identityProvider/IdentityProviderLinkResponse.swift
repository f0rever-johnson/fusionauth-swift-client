//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct IdentityProviderLinkResponse:Codable{
   
    public var identityProviderlink:IdentityProviderLink? = nil
    public var identityProdierLinks:[IdentityProviderLink]? = nil
    
    public init(identityProviderlink: IdentityProviderLink? = nil, identityProdierLinks: [IdentityProviderLink]? = nil) {
        self.identityProviderlink = identityProviderlink
        self.identityProdierLinks = identityProdierLinks
    }
}
