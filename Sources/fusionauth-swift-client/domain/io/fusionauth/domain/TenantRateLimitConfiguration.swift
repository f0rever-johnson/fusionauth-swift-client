//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct TenantRateLimitConfiguration:Codable{

    public var failedLogin:RateLimitedRequestConfiguration?
    public var forgotPassword:RateLimitedRequestConfiguration?
    public var sendEmailConfiguration:RateLimitedRequestConfiguration?
    public var sendPasswordless:RateLimitedRequestConfiguration?
    public var sendRegistrationVerification:RateLimitedRequestConfiguration?
    public var sendTwoFactor:RateLimitedRequestConfiguration?
    
    public init(failedLogin: RateLimitedRequestConfiguration? = nil, forgotPassword: RateLimitedRequestConfiguration? = nil, sendEmailConfiguration: RateLimitedRequestConfiguration? = nil, sendPasswordless: RateLimitedRequestConfiguration? = nil, sendRegistrationVerification: RateLimitedRequestConfiguration? = nil, sendTwoFactor: RateLimitedRequestConfiguration? = nil) {
        self.failedLogin = failedLogin
        self.forgotPassword = forgotPassword
        self.sendEmailConfiguration = sendEmailConfiguration
        self.sendPasswordless = sendPasswordless
        self.sendRegistrationVerification = sendRegistrationVerification
        self.sendTwoFactor = sendTwoFactor
    }
}
