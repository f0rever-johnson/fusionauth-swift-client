//
//  PasswordValidationRulesResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct PasswordValidatonRulesResponse:Codable {
    public var passwordValidationRules:PasswordValidationRules? = nil

    public init(passwordValidationRules: PasswordValidationRules? = nil) {
        self.passwordValidationRules = passwordValidationRules
    }

}
