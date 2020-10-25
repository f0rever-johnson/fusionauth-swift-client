//
//  IdentityProviderResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct IdentityProviderResponse:Codable {
    public var identityProvider:IdentityProviderConverter? = nil
    public var identityProviders:[IdentityProviderConverter]? = nil

    public init(identityProvider: IdentityProviderConverter? = nil, identityProviders: [IdentityProviderConverter]? = nil) {
        self.identityProvider = identityProvider
        self.identityProviders = identityProviders
    }

}
