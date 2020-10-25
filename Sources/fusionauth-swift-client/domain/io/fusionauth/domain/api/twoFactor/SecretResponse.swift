//
//  SecretResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct SecretResponse:Codable {
    public var secret:String? = nil
    public var secretBase32Encoded:String? = nil


    public init(secret: String? = nil, secretBase32Encoded: String? = nil) {
        self.secret = secret
        self.secretBase32Encoded = secretBase32Encoded
    }
}
