//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TenantMultiFactorConfiguration:Codable{

    public var authenticator:MultiFactorAuthenticatorMethod? = nil
    public var email:MultiFactorEmailMethod? = nil
    public var sms:MultiFactorSMSMethod? = nil
    
    public init(authenticator: MultiFactorAuthenticatorMethod? = nil, email: MultiFactorEmailMethod? = nil, sms: MultiFactorSMSMethod? = nil) {
        self.authenticator = authenticator
        self.email = email
        self.sms = sms
    }
    
}
