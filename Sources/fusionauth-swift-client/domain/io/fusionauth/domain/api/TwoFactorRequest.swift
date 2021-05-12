//
//  TwoFactorRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct TwoFactorRequest:Codable {
    
    public var authenticatorId:String? = nil
    public var code:String? = nil
    public var email:String? = nil
    public var method:String? = nil
    public var mobilPhone:String? = nil
    public var secret:String? = nil
    public var secretBase32Encoded:String? = nil
    
    public init(authenticatorId: String? = nil, code: String? = nil, email: String? = nil, method: String? = nil, mobilPhone: String? = nil, secret: String? = nil, secretBase32Encoded: String? = nil) {
        self.authenticatorId = authenticatorId
        self.code = code
        self.email = email
        self.method = method
        self.mobilPhone = mobilPhone
        self.secret = secret
        self.secretBase32Encoded = secretBase32Encoded
    }
    

}
