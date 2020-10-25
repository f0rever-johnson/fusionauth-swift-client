//
//  OAuthError.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class OAuthError:Codable{
    public var changePasswordId:String? = nil
    public var error:OAuthErrorType? = nil
    public var errorDescription:String? = nil
    public var errorReason:OAuthErrorReason? = nil
    public var errorURI:String? = nil
    public var twoFactorId:String? = nil

    public init(changePasswordId: String? = nil, error: OAuthErrorType? = nil, errorDescription: String? = nil, errorReason: OAuthErrorReason? = nil, errorURI: String? = nil, twoFactorId: String? = nil) {
        self.changePasswordId = changePasswordId
        self.error = error
        self.errorDescription = errorDescription
        self.errorReason = errorReason
        self.errorURI = errorURI
        self.twoFactorId = twoFactorId
    }
    
    
    private enum CodingKeys:String, CodingKey{
           case changePasswordId = "change_password_id"
           case error
           case errorDescription = "error_description"
           case errorReason = "error_reason"
           case errorURI = "error_uri"
           case twoFactorId = "two_factor_id"
       }
}
