//
//  IdentityProviderRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct IdentityProviderRequest:Codable {
    public var identityProvider:IdentityProviderConverter? = nil

    public init(identityProvider: IdentityProviderConverter? = nil) {
        self.identityProvider = identityProvider
    }

}
