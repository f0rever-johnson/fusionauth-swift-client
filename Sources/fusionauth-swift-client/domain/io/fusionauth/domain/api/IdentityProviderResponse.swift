//
//  IdentityProviderResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class IdentityProviderResponse:Codable {
    public var identityProvider:IdentityProviderConverter?
    public var identityProviders:[IdentityProviderConverter]?

    public init(identityProvider: IdentityProviderConverter? = nil, identityProviders: [IdentityProviderConverter]? = nil) {
        self.identityProvider = identityProvider
        self.identityProviders = identityProviders
    }

}
