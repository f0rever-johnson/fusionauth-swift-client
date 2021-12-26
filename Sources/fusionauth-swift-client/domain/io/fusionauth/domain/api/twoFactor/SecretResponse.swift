//
//  SecretResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct SecretResponse:Codable {
    public var secret:String?
    public var secretBase32Encoded:String?


    public init(secret: String? = nil, secretBase32Encoded: String? = nil) {
        self.secret = secret
        self.secretBase32Encoded = secretBase32Encoded
    }
}
