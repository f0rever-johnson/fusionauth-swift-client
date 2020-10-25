//
//  Tenant.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Tenant Object.
 */

public struct Tenant:Codable{
    public var configured:Bool? = nil
    public var data: [String:JSONObject]? = nil
    public var emailConfiguration:EmailConfiguration? = nil
    public var eventConfiguration:EventConfiguration? = nil
    public var externalIdentifierConfiguration:ExternalIdentifierConfiguration? = nil
    public var failedAuthenticationConfiguration:FailedAuthenticationConfiguration? = nil
    public var familyConfiguration:FamilyConfiguration? = nil
    public var httpSessionMaxInactiveInterval:Int? = nil
    public var id:UUID? = nil
    public var issuer:String? = nil
    public var jwtConfiguration:JWTConfiguration? = nil
    public var logoutURL:String? = nil
    public var maximumPasswordAge:MaximumPasswordAge? = nil
    public var minimumPasswordAge:MinimumPasswordAge? = nil
    public var name:String? = nil
    public var passwordEncrytionConfiguration:PasswordEncryptionConfiguration? = nil
    public var passwordValidationRules:PasswordValidationRules? = nil
    public var themeId:UUID? = nil

    public init(configured: Bool? = nil, data: [String:JSONObject]? = nil, emailConfiguration: EmailConfiguration? = nil, eventConfiguration: EventConfiguration? = nil, externalIdentifierConfiguration: ExternalIdentifierConfiguration? = nil, failedAuthenticationConfiguration: FailedAuthenticationConfiguration? = nil, familyConfiguration: FamilyConfiguration? = nil, httpSessionMaxInactiveInterval: Int? = nil, id: UUID? = nil, issuer: String? = nil, jwtConfiguration: JWTConfiguration? = nil, logoutURL: String? = nil, maximumPasswordAge: MaximumPasswordAge? = nil, minimumPasswordAge: MinimumPasswordAge? = nil, name: String? = nil, passwordEncrytionConfiguration: PasswordEncryptionConfiguration? = nil, passwordValidationRules: PasswordValidationRules? = nil, themeId: UUID? = nil) {
        self.configured = configured
        self.data = data
        self.emailConfiguration = emailConfiguration
        self.eventConfiguration = eventConfiguration
        self.externalIdentifierConfiguration = externalIdentifierConfiguration
        self.failedAuthenticationConfiguration = failedAuthenticationConfiguration
        self.familyConfiguration = familyConfiguration
        self.httpSessionMaxInactiveInterval = httpSessionMaxInactiveInterval
        self.id = id
        self.issuer = issuer
        self.jwtConfiguration = jwtConfiguration
        self.logoutURL = logoutURL
        self.maximumPasswordAge = maximumPasswordAge
        self.minimumPasswordAge = minimumPasswordAge
        self.name = name
        self.passwordEncrytionConfiguration = passwordEncrytionConfiguration
        self.passwordValidationRules = passwordValidationRules
        self.themeId = themeId
    }
}

