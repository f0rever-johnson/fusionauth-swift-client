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
    public var connectorPolicies:[ConnectorPolicy]? = nil
    public var data: [String:JSONObject]? = nil
    public var emailConfiguration:EmailConfiguration? = nil
    public var eventConfiguration:EventConfiguration? = nil
    public var externalIdentifierConfiguration:ExternalIdentifierConfiguration? = nil
    public var failedAuthenticationConfiguration:FailedAuthenticationConfiguration? = nil
    public var familyConfiguration:FamilyConfiguration? = nil
    public var formConfiguration:TenantFormConfiguration? = nil
    public var httpSessionMaxInactiveInterval:Int? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var issuer:String? = nil
    public var jwtConfiguration:JWTConfiguration? = nil
    public var lastUpdateInstant:Date? = nil
    public var loginConfiguration:TenantLoginConfiguration? = nil
    public var logoutURL:String? = nil
    public var maximumPasswordAge:MaximumPasswordAge? = nil
    public var minimumPasswordAge:MinimumPasswordAge? = nil
    public var multiFactorConfiguration:TenantMultiFactorConfiguration? = nil
    public var name:String? = nil
    public var passwordEncrytionConfiguration:PasswordEncryptionConfiguration? = nil
    public var passwordValidationRules:PasswordValidationRules? = nil
    public var state:ObjectState? = nil
    public var themeId:UUID? = nil
    public var userDeletePolicy:TenantUserDeletePolicy? = nil
    public var usernameConfiguration:TenantUsernameConfiguration? = nil
    
    public init(configured: Bool? = nil, connectorPolicies: [ConnectorPolicy]? = nil, data: [String : JSONObject]? = nil, emailConfiguration: EmailConfiguration? = nil, eventConfiguration: EventConfiguration? = nil, externalIdentifierConfiguration: ExternalIdentifierConfiguration? = nil, failedAuthenticationConfiguration: FailedAuthenticationConfiguration? = nil, familyConfiguration: FamilyConfiguration? = nil, formConfiguration: TenantFormConfiguration? = nil, httpSessionMaxInactiveInterval: Int? = nil, id: UUID? = nil, insertInstant: Date? = nil, issuer: String? = nil, jwtConfiguration: JWTConfiguration? = nil, lastUpdateInstant: Date? = nil, loginConfiguration: TenantLoginConfiguration? = nil, logoutURL: String? = nil, maximumPasswordAge: MaximumPasswordAge? = nil, minimumPasswordAge: MinimumPasswordAge? = nil, multiFactorConfiguration: TenantMultiFactorConfiguration? = nil, name: String? = nil, passwordEncrytionConfiguration: PasswordEncryptionConfiguration? = nil, passwordValidationRules: PasswordValidationRules? = nil, state: ObjectState? = nil, themeId: UUID? = nil, userDeletePolicy: TenantUserDeletePolicy? = nil, usernameConfiguration: TenantUsernameConfiguration? = nil) {
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
        self.passwordEncrytionConfiguration = passwordEncrytionConfiguration
        self.passwordValidationRules = passwordValidationRules
        self.state = state
        self.themeId = themeId
        self.userDeletePolicy = userDeletePolicy
        self.usernameConfiguration = usernameConfiguration
    }
    

}

