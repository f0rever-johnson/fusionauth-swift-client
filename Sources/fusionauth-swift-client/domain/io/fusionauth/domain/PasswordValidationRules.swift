//
//  PasswordValidationRules.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Password Validation Rules Object.
 */

public class PasswordValidationRules:Codable{
   
    public var maxLength:Int?
    public var minLength:Int?
    public var rememberPreviousPasswords:RememberPreviousPasswords?
    public var requireMixedCase:Bool?
    public var requireNonAlpha:Bool?
    public var requireNumber:Bool?
    public var validateOnLogin:Bool?
    
    internal init(maxLength: Int? = nil, minLength: Int? = nil, rememberPreviousPasswords: RememberPreviousPasswords? = nil, requireMixedCase: Bool? = nil, requireNonAlpha: Bool? = nil, requireNumber: Bool? = nil, validateOnLogin: Bool? = nil) {
        self.maxLength = maxLength
        self.minLength = minLength
        self.rememberPreviousPasswords = rememberPreviousPasswords
        self.requireMixedCase = requireMixedCase
        self.requireNonAlpha = requireNonAlpha
        self.requireNumber = requireNumber
        self.validateOnLogin = validateOnLogin
    }

}
