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

    public var accessControlConfiguration:TenantAccessControlConfiguration?
    public var captchaConfiguration:TenantCaptchaConfiguration?
    public var configured:Bool?
    public var connectorPolicies:[ConnectorPolicy]?
    public var data: [String:JSONObject]?
    public var emailConfiguration:EmailConfiguration?
    public var eventConfiguration:EventConfiguration?
    public var externalIdentifierConfiguration:ExternalIdentifierConfiguration?
    public var failedAuthenticationConfiguration:FailedAuthenticationConfiguration?
    public var familyConfiguration:FamilyConfiguration?
    public var formConfiguration:TenantFormConfiguration?
    public var httpSessionMaxInactiveInterval:Int?
    public var id:UUID?
    public var insertInstant:Date?
    public var issuer:String?
    public var jwtConfiguration:JWTConfiguration?
    public var lastUpdateInstant:Date?
    public var loginConfiguration:TenantLoginConfiguration?
    public var logoutURL:String?
    public var maximumPasswordAge:MaximumPasswordAge?
    public var minimumPasswordAge:MinimumPasswordAge?
    public var multiFactorConfiguration:TenantMultiFactorConfiguration?
    public var name:String?
    public var oauth2Configuration:TenantOauth2Configuration?
    public var passwordEncrytionConfiguration:PasswordEncryptionConfiguration?
    public var passwordValidationRules:PasswordValidationRules?
    public var rateLimitConfiguration:TenantRateLimitConfiguration?
    public var registrationConfiguration:TenantRegistrationConfiguration?
    public var state:ObjectState?
    public var themeId:UUID?
    public var userDeletePolicy:TenantUserDeletePolicy?
    public var usernameConfiguration:TenantUsernameConfiguration?

    public init(accessControlConfiguration: TenantAccessControlConfiguration? = nil, captchaConfiguration: TenantCaptchaConfiguration? = nil, configured: Bool? = nil, connectorPolicies: [ConnectorPolicy]? = nil, data: [String : JSONObject]? = nil, emailConfiguration: EmailConfiguration? = nil, eventConfiguration: EventConfiguration? = nil, externalIdentifierConfiguration: ExternalIdentifierConfiguration? = nil, failedAuthenticationConfiguration: FailedAuthenticationConfiguration? = nil, familyConfiguration: FamilyConfiguration? = nil, formConfiguration: TenantFormConfiguration? = nil, httpSessionMaxInactiveInterval: Int? = nil, id: UUID? = nil, insertInstant: Date? = nil, issuer: String? = nil, jwtConfiguration: JWTConfiguration? = nil, lastUpdateInstant: Date? = nil, loginConfiguration: TenantLoginConfiguration? = nil, logoutURL: String? = nil, maximumPasswordAge: MaximumPasswordAge? = nil, minimumPasswordAge: MinimumPasswordAge? = nil, multiFactorConfiguration: TenantMultiFactorConfiguration? = nil, name: String? = nil, oauth2Configuration: TenantOauth2Configuration? = nil, passwordEncrytionConfiguration: PasswordEncryptionConfiguration? = nil, passwordValidationRules: PasswordValidationRules? = nil, rateLimitConfiguration: TenantRateLimitConfiguration? = nil, registrationConfiguration: TenantRegistrationConfiguration? = nil, state: ObjectState? = nil, themeId: UUID? = nil, userDeletePolicy: TenantUserDeletePolicy? = nil, usernameConfiguration: TenantUsernameConfiguration? = nil) {
        self.accessControlConfiguration = accessControlConfiguration
        self.captchaConfiguration = captchaConfiguration
        self.configured = configured
        self.connectorPolicies = connectorPolicies
        self.data = data
        self.emailConfiguration = emailConfiguration
        self.eventConfiguration = eventConfiguration
        self.externalIdentifierConfiguration = externalIdentifierConfiguration
        self.failedAuthenticationConfiguration = failedAuthenticationConfiguration
        self.familyConfiguration = familyConfiguration
        self.formConfiguration = formConfiguration
        self.httpSessionMaxInactiveInterval = httpSessionMaxInactiveInterval
        self.id = id
        self.insertInstant = insertInstant
        self.issuer = issuer
        self.jwtConfiguration = jwtConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.loginConfiguration = loginConfiguration
        self.logoutURL = logoutURL
        self.maximumPasswordAge = maximumPasswordAge
        self.minimumPasswordAge = minimumPasswordAge
        self.multiFactorConfiguration = multiFactorConfiguration
        self.name = name
        self.oauth2Configuration = oauth2Configuration
        self.passwordEncrytionConfiguration = passwordEncrytionConfiguration
        self.passwordValidationRules = passwordValidationRules
        self.rateLimitConfiguration = rateLimitConfiguration
        self.registrationConfiguration = registrationConfiguration
        self.state = state
        self.themeId = themeId
        self.userDeletePolicy = userDeletePolicy
        self.usernameConfiguration = usernameConfiguration
    }
    
}

