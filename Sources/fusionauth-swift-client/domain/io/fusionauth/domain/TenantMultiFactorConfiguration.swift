//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TenantMultiFactorConfiguration:Codable{

    public var authenticator:MultiFactorAuthenticatorMethod?
    public var email:MultiFactorEmailMethod?
    public var sms:MultiFactorSMSMethod?
    
    public init(authenticator: MultiFactorAuthenticatorMethod? = nil, email: MultiFactorEmailMethod? = nil, sms: MultiFactorSMSMethod? = nil) {
        self.authenticator = authenticator
        self.email = email
        self.sms = sms
    }
    
}
