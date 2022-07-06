//
//  OAuthError.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class OAuthError:Codable{

    public var changePasswordId:String?
    public var error:OAuthErrorType?
    public var errorDescription:String?
    public var errorReason:OAuthErrorReason?
    public var errorURI:String?
    public var twoFactorId:String?
    public var twoFactorMethods:[TwoFactorMethod]

    public init(changePasswordId: String? = nil, error: OAuthErrorType? = nil, errorDescription: String? = nil, errorReason: OAuthErrorReason? = nil, errorURI: String? = nil, twoFactorId: String? = nil, twoFactorMethods: [TwoFactorMethod]) {
        self.changePasswordId = changePasswordId
        self.error = error
        self.errorDescription = errorDescription
        self.errorReason = errorReason
        self.errorURI = errorURI
        self.twoFactorId = twoFactorId
        self.twoFactorMethods = twoFactorMethods
    }
    
    
    private enum CodingKeys:String, CodingKey{
        case changePasswordId = "change_password_id"
        case error
        case errorDescription = "error_description"
        case errorReason = "error_reason"
        case errorURI = "error_uri"
        case twoFactorId = "two_factor_id"
        case twoFactorMethods = "two_factor_methods"
    }
}
