//
//  IdentityProviderRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct IdentityProviderRequest:Codable {
    public var identityProvider:IdentityProviderConverter? = nil

    public init(identityProvider: IdentityProviderConverter? = nil) {
        self.identityProvider = identityProvider
    }

}
