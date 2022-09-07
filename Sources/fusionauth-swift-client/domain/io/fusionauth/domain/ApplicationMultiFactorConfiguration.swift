//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class ApplicationMultiFactorConfiguration:Codable{

    public var email:MultiFactorEmailTemplate?
    public var loginPolicy:MultiFactorLoginPolicy?
    public var sms:MultiFactorSMSTemplate?
    public var trustPolicy:ApplicationMultiFactorTrustPolicy?
    
    public init(email: MultiFactorEmailTemplate? = nil, loginPolicy: MultiFactorLoginPolicy? = nil, sms: MultiFactorSMSTemplate? = nil, trustPolicy: ApplicationMultiFactorTrustPolicy? = nil) {
        self.email = email
        self.loginPolicy = loginPolicy
        self.sms = sms
        self.trustPolicy = trustPolicy
    }
}
