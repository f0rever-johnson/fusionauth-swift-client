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
   
    public var maxLength:Int? = nil
    public var minLength:Int? = nil
    public var rememberPreviousPasswords:RememberPreviousPasswords? = nil
    public var requireMixedCase:Bool? = nil
    public var requireNonAlpha:Bool? = nil
    public var requireNumber:Bool? = nil
    public var validateOnLogin:Bool = nil
    
    internal init(maxLength: Int? = nil, minLength: Int? = nil, rememberPreviousPasswords: RememberPreviousPasswords? = nil, requireMixedCase: Bool? = nil, requireNonAlpha: Bool? = nil, requireNumber: Bool? = nil, validateOnLogin: Bool = nil) {
        self.maxLength = maxLength
        self.minLength = minLength
        self.rememberPreviousPasswords = rememberPreviousPasswords
        self.requireMixedCase = requireMixedCase
        self.requireNonAlpha = requireNonAlpha
        self.requireNumber = requireNumber
        self.validateOnLogin = validateOnLogin
    }

}
