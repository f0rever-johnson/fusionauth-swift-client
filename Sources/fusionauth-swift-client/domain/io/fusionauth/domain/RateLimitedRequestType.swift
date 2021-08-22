//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public enum RateLimitedRequestType:String, Codable{
    case failedLogin = "FailedLogin"
    case forgotPassword = "ForgotPassword"
    case sendEmailVerification = "SendEmailVerification"
    case sendPasswordless = "SendPasswordless"
    case sendRegistrationVerification = "SendRegistrationVerification"
    case sendTwoFactor = "SendTwoFactor"
}
