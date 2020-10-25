//
//  TwoFactorRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct TwoFactorRequest:Codable {
    public var code:String? = nil
    public var delivery:TwoFactorDelivery? = nil
    public var secret:String? = nil
    public var secretBase32Encoded:String? = nil

    public init(code: String? = nil, delivery: TwoFactorDelivery? = nil, secret: String? = nil, secretBase32Encoded: String? = nil) {
        self.code = code
        self.delivery = delivery
        self.secret = secret
        self.secretBase32Encoded = secretBase32Encoded
    }

}
